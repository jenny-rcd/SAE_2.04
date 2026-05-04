drop table if exists t_s204_hopital     cascade;
drop table if exists t_s204_laboratoire cascade;
drop table if exists t_s204_service     cascade;
drop table if exists t_s204_medecin     cascade;
drop table if exists t_s204_patient     cascade;
drop table if exists t_s204_consulte    cascade;

create table t_s204_hopital
(
	idHop       integer, 
	nom_hop     varchar(30),
	adresse_hop varchar(70),
	tel_hop     varchar(15)
);

create table t_s204_laboratoire
(
idLab   integer,
nom_lab varchar(70),
idHop   integer
);
create table t_s204_service
(
idServ   integer,
nom_serv varchar,
nb_lits  integer,
idHop    integer
);
create table t_s204_medecin
(
idMed    integer,
nom_med  varchar(35),
mail_med varchar(60),
spec     varchar(20),
fct      varchar(30),
idLab    integer,
idServ   integer,
idHop    integer
);
create table t_s204_patient
(
idPat       integer    ,
nom_pat     varchar(50),
prenom_pat  varchar(50),
adresse_pat varchar(70),
date_nais   varchar(12)
);
create table t_s204_consulte
(
idPat        integer,
idMed        integer,
date_consult timestamp
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
