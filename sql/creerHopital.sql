/**
  * Création des tables
  * Date : 4 mai 2026
  * @author Jenny Richard, Antoine Bertin, Kyerann Cochaux
  */


DROP TABLE IF EXISTS t_s204_hopital     cascade;
DROP TABLE IF EXISTS t_s204_laboratoire cascade;
DROP TABLE IF EXISTS t_s204_service     cascade;
DROP TABLE IF EXISTS t_s204_medecin     cascade;
DROP TABLE IF EXISTS t_s204_patient     cascade;
DROP TABLE IF EXISTS t_s204_consulte    cascade;

CREATE TABLE t_s204_hopital
(
	idHop       INTEGER         NULL,
	nom_hop     VARCHAR(30) NOT NULL,
	adresse_hop VARCHAR(70) NOT NULL,
	tel_hop     VARCHAR(15) NOT NULL
);

CREATE TABLE t_s204_laboratoire
(
	idLab   INTEGER     NOT NULL,
	nom_lab VARCHAR(70) NOT NULL,
	idHop   INTEGER     NOT NULL
);
CREATE TABLE t_s204_service
(
	idServ   INTEGER NOT NULL,
	nom_serv VARCHAR NOT NULL,
	nb_lits  INTEGER NOT NULL,
	idHop    INTEGER NOT NULL
);
CREATE TABLE t_s204_medecin
(
	idMed    INTEGER            NOT NULL,
	nom_med  VARCHAR(35)        NOT NULL,
	mail_med VARCHAR(60) unique NOT NULL,
	spec     VARCHAR(20)        NOT NULL,
	fct      VARCHAR(30)        NOT NULL,
	idLab    INTEGER                NULL,
	idServ   INTEGER                NULL,
	idHop    INTEGER            NOT NULL
);
CREATE TABLE t_s204_patient
(
	idPat       INTEGER     NOT NULL,
	nom_pat     VARCHAR(50) NOT NULL,
	prenom_pat  VARCHAR(50) NOT NULL,
	adresse_pat VARCHAR(70) NOT NULL,
	date_nais   date        NOT NULL
);
CREATE TABLE t_s204_consulte
(
	idPat        INTEGER   NOT NULL,
	idMed        INTEGER   NOT NULL,
	date_consult timestamp NOT NULL
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
FOREIGN KEY  (idHop)  REFERENCES t_s204_hopital(idHop);

ALTER TABLE t_s204_service
ADD CONSTRAINT fk_idHop
FOREIGN KEY  (idHop)  REFERENCES t_s204_hopital(idHop);

ALTER TABLE t_s204_medecin
ADD CONSTRAINT fk_idLab
FOREIGN KEY  (idLab)  REFERENCES t_s204_laboratoire(idLab);

ALTER TABLE t_s204_medecin
ADD CONSTRAINT fk_idServ
FOREIGN KEY  (idServ) REFERENCES t_s204_service(idServ);

ALTER TABLE t_s204_medecin
ADD CONSTRAINT fk_idHop
FOREIGN KEY  (idHop)  REFERENCES t_s204_hopital(idHop);

ALTER TABLE t_s204_consulte
ADD CONSTRAINT fk_idPat
FOREIGN KEY  (idPat)  REFERENCES t_s204_patient(idPat);

ALTER TABLE t_s204_consulte
ADD CONSTRAINT fk_idMed
FOREIGN KEY  (idMed)  REFERENCES t_s204_medecin(idMed);

ALTER TABLE t_s204_medecin
add CONSTRAINT ch_fct
CHECK (fct IN ('CONSULTANT','CHERCHEUR','PRATICIEN'));

ALTER TABLE t_s204_service
add CONSTRAINT ch_nb_lits
CHECK (nb_lits >= 0);



