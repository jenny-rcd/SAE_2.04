drop table if exists t_s204_hopital     cascade;
drop table if exists t_s204_laboratoire cascade;
drop table if exists t_s204_service     cascade;
drop table if exists t_s204_medecin     cascade;
drop table if exists t_s204_patient     cascade;
drop table if exists t_s204_consulte    cascade;

create table t_s204_hopital
(
	idHop       integer         null,
	nom_hop     varchar(30) not null,
	adresse_hop varchar(70) not null,
	tel_hop     varchar(15) not null
);

create table t_s204_laboratoire
(
	idLab   integer     not null,
	nom_lab varchar(70) not null,
	idHop   integer     not null
);
create table t_s204_service
(
	idServ   integer not null,
	nom_serv varchar not null,
	nb_lits  integer not null,
	idHop    integer not null
);
create table t_s204_medecin
(
	idMed    integer            not null,
	nom_med  varchar(35)        not null,
	mail_med varchar(60) unique not null,
	spec     varchar(20)        not null,
	fct      varchar(30)        not null,
	idLab    integer                null,
	idServ   integer                null,
	idHop    integer            not null
);
create table t_s204_patient
(
	idPat       integer     not null,
	nom_pat     varchar(50) not null,
	prenom_pat  varchar(50) not null,
	adresse_pat varchar(70) not null,
	date_nais   varchar(12) not null
);
create table t_s204_consulte
(
	idPat        integer   not null,
	idMed        integer   not null,
	date_consult timestamp not null
);

ALTER TABLE t_s204_hopital
ADD CONSTRAINT pk_idHop 
PRIMARY KEY (idHop);

ALTER TABLE t_s204_laboratoire
ADD CONSTRAINT pk_idLab 
PRIMARY KEY (idLab);

ALTER TABLE t_s204_service
ADD CONSTRAINT pk_idServ
PRIMARY KEY (idServ);

ALTER TABLE t_s204_medecin
ADD CONSTRAINT pk_idMed
PRIMARY KEY (idMed);

ALTER TABLE t_s204_patient
ADD CONSTRAINT pk_idPat
PRIMARY KEY (idPat);

ALTER TABLE t_s204_consulte
ADD CONSTRAINT pk_consulte
PRIMARY KEY (idPat,idMed,date_consult);


ALTER TABLE t_s204_laboratoire
ADD CONSTRAINT fk_idHop
FOREIGN KEY  (idHop)  references t_s204_hopital(idHop);

ALTER TABLE t_s204_service
ADD CONSTRAINT fk_idHop
FOREIGN KEY  (idHop)  references t_s204_hopital(idHop);

ALTER TABLE t_s204_medecin
ADD CONSTRAINT fk_idLab
FOREIGN KEY  (idLab)  references t_s204_laboratoire(idLab);

ALTER TABLE t_s204_medecin
ADD CONSTRAINT fk_idServ
FOREIGN KEY  (idServ) references t_s204_service(idServ);

ALTER TABLE t_s204_medecin
ADD CONSTRAINT fk_idHop
FOREIGN KEY  (idHop)  references t_s204_hopital(idHop);

ALTER TABLE t_s204_consulte
ADD CONSTRAINT fk_idPat
FOREIGN KEY  (idPat)  references t_s204_patient(idPat);

ALTER TABLE t_s204_consulte
ADD CONSTRAINT fk_idMed
FOREIGN KEY  (idMed)  references t_s204_medecin(idMed);

alter table t_s204_medecin
add constraint ch_fct
check (fct in ('CONSULTANT','CHERCHEUR','PRATICIEN'));

alter table t_s204_service
add constraint ch_nb_lits
check (nb_lits >= 0);



