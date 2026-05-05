/**
  * Insertion dans les tables
  * Date : 4 mai 2026
  * @author Jenny Richard, Antoine Bertin, Kyerann Cochaux
  */



INSERT INTO t_s204_hopital (idHop, nom_hop, adresse_hop, tel_hop)
VALUES
	( 0, 'Flaubert'         , '55 Bis Rue Gustave Flaubert 76600'    , '02 32 73 32 32' ),
	( 1, 'Pierre Janet'     , '47 Rue de Tourneville 76600'          , '02 32 73 39 20' ),
	( 2, 'Raoul Dufy'       , '4 Rue Lanfant de Metz 76600'          , '02 32 73 39 50' ),
	( 3, 'Jacques Monod'    , '29 Avenue Pierre Mendès France 76290' , '02 32 73 32 32' ),
	( 4, 'HPE-Ramsay santé' , '505 Rue Irène Joliot Curie 76600'     , '02 52 68 02 02' );


INSERT INTO t_s204_laboratoire (idLab, nom_lab, idHop)
VALUES
	( 00, 'Biochimie'           , 0 ),
	( 01, 'Microbiologie'       , 0 ),
	
	( 10, 'Hématologie'         , 0 ),
	( 11, 'Hématologie'         , 2 ),
	( 12, 'Hématologie'         , 3 ),
	( 13, 'Hématologie'         , 4 ),
	
	( 30, 'Auto-immunité'       , 0 ),
	
	( 40, 'Neurophysiologie'    , 0 ),
	
	( 50, 'Biologie'            , 1 ),
	( 51, 'Biologie'            , 2 ),
	( 52, 'Biologie'            , 3 ),
	( 53, 'Biologie'            , 4 ),
	
	( 60, 'Pharmacotoxicologie' , 1 ),
	
	( 70, 'Neuropathologie'     , 1 ),
	
	( 80, 'Bactériologie'       , 1 ),
	( 81, 'Bactériologie'       , 2 ),
	( 82, 'Bactériologie'       , 3 ),
	( 83, 'Bactériologie'       , 4 ),
	
	( 90, 'Fertilité'           , 2 ),
	( 91, 'Fertilité'           , 3 ),
	( 92, 'Fertilité'           , 4 );


INSERT INTO t_s204_service (idServ, nom_serv, nb_lits, idHop)
VALUES
	(  00, 'Ophtalmologie'     ,  51, 0 ),
	
	(  10, 'Dermatologie'      ,  69, 0 ),
	
	(  20, 'Pédiatrie'         ,  93, 0 ),
	
	(  21, 'Pédiatrie'         ,  93, 2 ),
	
	(  30, 'Psychiatrie'       ,  99, 1 ),
	
	(  40, 'Neurologie'        ,  69, 1 ),
	
	(  50, 'Stomatologie'      ,  93, 2 ),
	
	(  60, 'Cardiologie'       , 109, 3 ),
	(  61, 'Cardiologie'       , 135, 4 ),
	
	(  70, 'Gynécologie'       ,  67, 3 ),
	
	(  80, 'Gastro-entérologie',  55, 3 ),
	(  81, 'Gastro-entérologie',  73, 4 ),
	
	(  90, 'Endocrinologie'    ,  91, 3 ),
	
	( 100, 'Cancérologie'      , 111, 4 );


INSERT INTO t_s204_medecin (idMed, nom_med, mail_med, spec, fct, idLab, idServ, idHop)
VALUES
	( 01, 'Robert'   , 'robert.bac@hopital.fr'   , 'Bactériologiste'   , 'CHERCHEUR' ,   82, NULL, 3 ),
	( 02, 'Vercoust' , 'vercoust.hem@hopital.fr' , 'Hématologiste'     , 'CHERCHEUR' ,   12, NULL, 3 ),
	( 03, 'Favier'   , 'favier.gyn@hopital.fr'   , 'Gynécologue'       , 'PRATICIEN' , NULL,   70, 3 ),
	( 04, 'Sorrel'   , 'sorrel.ped@hopital.fr'   , 'Pédiatre'          , 'PRATICIEN' , NULL,   20, 0 ),
	( 05, 'Lévecque' , 'levecque.ped@hopital.fr' , 'Pédiatre'          , 'PRATICIEN' , NULL,   21, 2 ),
	( 06, 'Morrice'  , 'morrice.sto@hopital.fr'  , 'Stomatologue'      , 'PRATICIEN' , NULL,   50, 2 ),
	( 07, 'Firmin'   , 'firmin.gyn@hopital.fr'   , 'Gynécologue'       , 'CONSULTANT', NULL, NULL, 3 ),
	( 08, 'Ferret'   , 'ferret.car@hopital.fr'   , 'Cardiologue'       , 'PRATICIEN' , NULL,   60, 3 ),
	( 09, 'Blanchard', 'blanchard.car@hopital.fr', 'Cardiologue'       , 'PRATICIEN' , NULL,   61, 4 ),
	( 10, 'Aubin'    , 'aubin.gyn@hopital.fr'    , 'Gynécologue'       , 'PRATICIEN' , NULL,   70, 3 ),
	( 11, 'Renault'  , 'renault.psy@hopital.fr'  , 'Psychiatre'        , 'PRATICIEN' , NULL,   30, 1 ),
	( 12, 'Leroy'    , 'leroy.psy@hopital.fr'    , 'Psychiatre'        , 'CONSULTANT', NULL, NULL, 1 ),
	( 13, 'Perrot'   , 'perrot.neu@hopital.fr'   , 'Neurologue'        , 'PRATICIEN' , NULL,   40, 1 ),
	( 14, 'Amiot'    , 'amiot.der@hopital.fr'    , 'Dermatologue'      , 'PRATICIEN' , NULL,   10, 0 ),
	( 15, 'Vincent'  , 'vincent.oph@hopital.fr'  , 'Ophtalmologue'     , 'PRATICIEN' , NULL,    0, 0 ),
	( 16, 'Lalande'  , 'lalande.gas@hopital.fr'  , 'Gastro-entérologue', 'PRATICIEN' , NULL,   81, 4 ),
	( 17, 'Perrin'   , 'perrin.gas@hopital.fr'   , 'Gastro-entérologue', 'PRATICIEN' , NULL,   81, 4 ),
	( 18, 'Mercier'  , 'mercier.gas@hopital.fr'  , 'Gastro-entérologue', 'PRATICIEN' , NULL,   80, 3 ),
	( 19, 'Pasquet'  , 'pasquet.end@hopital.fr'  , 'Endocrinologue'    , 'PRATICIEN' , NULL,   90, 3 );


INSERT INTO t_s204_patient (idPat, nom_pat, prenom_pat, adresse_pat, date_nais)
VALUES
	( 01, 'Martin' , 'Claire' , '12 Rue des Lilas 76600'      , DATE '1978-04-12' ),
	( 02, 'Durand' , 'Paul'   , '8 Rue Victor Hugo 76600'     , DATE '1990-09-23' ),
	( 03, 'Bernard', 'Sophie' , '3 Avenue Pasteur 76290'      , DATE '1982-01-30' ),
	( 04, 'Petit'  , 'Lucas'  , '14 Rue Voltaire 76600'       , DATE '2017-06-15' ),
	( 05, 'Moreau' , 'Emma'   , '22 Rue de Paris 76600'       , DATE '1970-11-02' ),
	( 06, 'Lefevre', 'Hugo'   , '9 Rue Jean Jaurès 76600'     , DATE '1985-07-19' ),
	( 07, 'Roux'   , 'Nina'   , '5 Rue Carnot 76600'          , DATE '1998-03-05' ),
	( 08, 'Simon'  , 'Arthur' , '31 Boulevard Maritime 76600' , DATE '1965-12-27' ),
	( 09, 'Fournier', 'Julie' , '6 Rue Anatole France 76290'  , DATE '1988-08-08' ),
	( 10, 'Girard' , 'Noé'    , '17 Rue Jules Ferry 76600'    , DATE '2004-05-21' );



INSERT INTO t_s204_consulte (idPat, idMed, date_consult)
VALUES
	-- Patients ayant consulté un gynécologue / un consultant à Jacques Monod
	( 01, 07, TIMESTAMP '2026-01-10 09:30:00' ),
	( 02, 03, TIMESTAMP '2026-01-11 10:00:00' ),
	( 03, 10, TIMESTAMP '2026-01-12 14:15:00' ),
	( 09, 07, TIMESTAMP '2026-02-03 11:00:00' ),
	
	-- Plusieurs hôpitaux pour tester la requête C.2.4
	( 01, 09, TIMESTAMP '2026-02-15 08:45:00' ),
	( 01, 14, TIMESTAMP '2026-03-01 13:30:00' ),
	( 06, 11, TIMESTAMP '2026-02-20 15:00:00' ),
	( 06, 18, TIMESTAMP '2026-03-02 09:00:00' ),
	
	-- Consultations diverses
	( 04, 04, TIMESTAMP '2026-01-20 16:00:00' ),
	( 05, 08, TIMESTAMP '2026-01-21 09:00:00' ),
	( 05, 18, TIMESTAMP '2026-02-01 10:30:00' ),
	( 07, 12, TIMESTAMP '2026-02-05 11:45:00' ),
	( 08, 16, TIMESTAMP '2026-02-09 17:00:00' ),
	( 10, 13, TIMESTAMP '2026-02-13 12:00:00' ),
	
	-- Patient ayant fréquenté tous les services de Jacques Monod
	( 3, 08, TIMESTAMP '2026-03-10 09:00:00' ),
	( 3, 18, TIMESTAMP '2026-03-11 10:00:00' ),
	( 3, 19, TIMESTAMP '2026-03-12 11:00:00' );

