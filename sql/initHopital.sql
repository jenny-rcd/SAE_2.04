/**
  * Insertion dans les tables
  * Date : 4 mai 2026
  * @author Jenny Richard, Antoine Bertin, Kyerann Cochaux
  */


INSERT INTO t_s204_hopital (idHop, nom_hop, adresse_hop, tel_hop)
VALUES
(
	( 0, 'Flaubert'         , '55 Bis Rue Gustave Flaubert 76600'    , '02 32 73 32 32' ),
	( 1, 'Pierre Janet'     , '47 Rue de Tourneville 76600'          , '02 32 73 39 20' ),
	( 2, 'Raoul Dufy'       , '4 Rue Lanfant de Metz 76600'          , '02 32 73 39 50' ),
	( 3, 'Jacques Monod'    , '29 Avenue Pierre Mendès France 76290' , '02 32 73 32 32' ),
	( 4, 'HPE-Ramsay santé', '505 Rue Irène Joliot Curie 76600'     , '02 52 68 02 02' )
);

INSERT INTO t_s204_laboratoire (idLab, nom_lab, idHop)
VALUES
(
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
	( 92, 'Fertilité'           , 4 )
);

INSERT INTO t_s204_service (idServ, nom_serv, nb_lits, idHop)
VALUES
(
	(  00, 'Ophtalmologie'     ,  51, 0 ),
	
	(  10, 'Dermatologie'      ,  69, 0 ),
	
	(  20, 'Pédiatrie'         ,  93, 0 ),
	
	(  30, 'Psychiatrie'       ,  99, 1 ),
	
	(  40, 'Neurologie'        ,  69, 1 ),
	
	(  50, 'Stomatologie'      ,  93, 2 ),
	
	(  60, 'Cardiologie'       , 109, 3 ),
	(  61, 'Cardiologie'       , 135, 4 ),
	
	(  70, 'Gynécologie'       ,  67, 3 ),
	
	(  80, 'Gastro-entérologie',  55, 3 ),
	(  81, 'Gastro-entérologie',  73, 4 ),
	
	(  90, 'Endocrinologie'    ,  91, 3 ),
	
	( 100, 'Cancérologie'      , 111, 4 )
);


INSERT INTO t_s204_medecin (idMed, nom_med, mail_med, spec, fct, idLab, idServ, idHop)
VALUES
(
	( 0, 'Robert'   , 'Robert.Bac@gmail.com'   , 'Bactériologiste'   , 'CHERCHEUR' ,   82, null, 3 ),
	( 0, 'Vercoust' , 'Vercoust.Hém@gmail.com' , 'Hématologiste'     , 'CHERCHEUR' ,   12, null, 3 ),
	( 0, 'Favier'   , 'Favier.Gyn@gmail.com'   , 'Gynécologue'       , 'PRATICIEN' , null,   70, 3 ),
	( 0, 'Sorrel'   , 'Sorrel.Péd@gmail.com'   , 'Pédiatre'          , 'PRATICIEN' , null,   20, 0 ),
	( 0, 'Lévecque' , 'Lévecque.Péd@gmail.com' , 'Pédiatre'          , 'PRATICIEN' , null,   20, 2 ),
	( 0, 'Morrice'  , 'Morrice.Sto@gmail.com'  , 'Stomatologue'      , 'PRATICIEN' , null,   50, 2 ),
	( 0, 'Firmin'   , 'Firmin.Gyn@gmail.com'   , 'Gynécologue'       , 'CONSULTANT', null, null, 3 ),
	( 0, 'Ferret'   , 'Ferret.Car@gmail.com'   , 'Cardiologue'       , 'PRATICIEN' , null,   60, 3 ),
	( 0, 'Blanchard', 'Blanchard.Car@gmail.com', 'Cardiologue'       , 'PRATICIEN' , null,   61, 4 ),
	( 0, 'Aubin'    , 'Aubin.Gyn@gmail.com'    , 'Gynécologue'       , 'PRATICIEN' , null,   70, 3 ),
	( 0, 'Renault'  , 'Renault.Psy@gmail.com'  , 'Psychiatre'        , 'PRATICIEN' , null,   30, 1 ),
	( 0, 'Leroy'    , 'Leroy.Psy@gmail.com'    , 'Psychiatre'        , 'CONSULTANT', null, null, 1 ),
	( 0, 'Perrot'   , 'Perrot.Neu@gmail.com'   , 'Neurologue'        , 'PRATICIEN' , null,   40, 1 ),
	( 0, 'Amiot'    , 'Amiot.Der@gmail.com'    , 'Dermatologue'      , 'PRATICIEN' , null,   10, 0 ),
	( 0, 'Vincent'  , 'Vincent.Oph@gmail.com'  , 'Ophtalmologue'     , 'PRATICIEN' , null,   00, 0 ),
	( 0, 'Lalande'  , 'Lalande.Gas@gmail.com'  , 'Gastro-entérologue', 'PRATICIEN' , null,   81, 4 ),
	( 0, 'Perrin'   , 'Perrin.Gas@gmail.com'   , 'Gastro-entérologue', 'PRATICIEN' , null,   81, 4 ),
	( 0, 'Mercier'  , 'Mercier.Gas@gmail.com'  , 'Gastro-entérologue', 'PRATICIEN' , null,   80, 3 ),
	( 0, 'Pasquet'  , 'Pasquet.End@gmail.com'  , 'Endocrinologue'    , 'PRATICIEN' , null,   90, 3 )
);


INSERT INTO t_s204_patient (idPat, nom_pat, prenom_pat, adresse_pat, date_nais)
VALUES
(
	
);



INSERT INTO t_s204_consulte (idPat, idMed, date_consult)
VALUES
(
	
);

