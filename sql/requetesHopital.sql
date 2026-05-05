/**
  * Requettes 
  * Date : 5 mai 2026
  * @author Jenny Richard, Antoine Bertin, Kyerann Cochaux
  */



-- C.1°) Écrire en algèbre relationnelle, puis en SQL les requêtes permettant de fournir les informations
--   demandées par chacune des questions suivantes :

--   1. Les noms des services ayant plus de 100 lits.
SELECT serv.nom_serv
FROM   t_s204_service as serv
WHERE  serv.nb_lits > 100;


--   2. Noms des hôpitaux qui ont un service de Cardiologie.
SELECT nom_hop
FROM   t_s204_hopital
           JOIN t_s204_service USING(idHop)
WHERE  nom_serv = 'Cardiologie';


--   3. Les noms des laboratoires de l’hôpital Jacques Monod.
SELECT nom_lab
FROM   t_s204_laboratoire
           JOIN t_s204_hopital USING(idHop)
WHERE  nom_hop = 'Jacques Monod';


--   4. Noms des patients ayant consulté un gynécologue.
SELECT nom_pat
FROM t_s204_patient
         JOIN t_s204_consulte USING(idPat)
         JOIN t_s204_medecin  USING(idMed)
WHERE spec = 'Gynécologue';


--   5. Liste des consultations de médecins (nom du médecin, nom du patient et la date de
--   consultation).
SELECT nom_med,
       nom_pat,
       date_consult

FROM t_s204_patient
         JOIN t_s204_consulte USING(idPat)
         JOIN t_s204_medecin  USING(idMed);



--   6. Noms des patients ayant consulté un médecin consultant indépendant à l'hôpital Jacques
--   Monod.
SELECT nom_pat
FROM t_s204_patient
         JOIN t_s204_consulte USING(idPat)
         JOIN t_s204_medecin  USING(idMed)
         JOIN t_s204_hopital  USING(idHop)
WHERE fct = 'CONSULTANT' AND nom_hop ='Jacques Monod';


--   7. Noms des patients n'ayant consulté qu'à l'hôpital Jacques Monod.
SELECT nom_pat
FROM   t_s204_patient

EXCEPT

SELECT nom_pat
FROM t_s204_patient
         JOIN t_s204_consulte USING(idPat)
         JOIN t_s204_medecin  USING(idMed)
         JOIN t_s204_hopital  USING(idHop)
WHERE nom_hop != 'Jacques Monod';




-- C.2 °) Écrire uniquement en SQL les requêtes permettant de fournir les informations demandées par
-- chacune des questions suivantes :


--   1. Liste des noms des médecins de la même spécialité que le médecin Firmin, cette liste est triée
--   par ordre alphabétique.
SELECT med.nom_med
FROM   t_s204_medecin as med
WHERE  med.spec = (SELECT med2.spec
                   FROM   t_s204_medecin as med2
                   WHERE  med2.nom_med = 'Firmin' )
ORDER BY med.nom_med;
-- J'inclus 'Firmin' ?



--   2. Les noms des hôpitaux avec un service de Cardiologie de capacité supérieure au service de
--   Cardiologie de l'hôpital Jacques Monod.
SELECT hop.nom_hop
FROM   t_s204_service as serv
       INNER JOIN 
       t_s204_hopital as hop
           ON serv.idHop = hop.idHop
WHERE serv.nom_serv = 'Cardiologie' AND
      serv.nb_lits > (SELECT serv2.nb_lits
                      FROM   t_s204_service as serv2
                             INNER JOIN 
                             t_s204_hopital as hop2
                                 ON serv2.idHop = hop2.idHop
                      WHERE  hop2.nom_hop   = 'Jacques Monod' AND
                             serv2.nom_serv = 'Cardiologie');



--   3. Les hôpitaux ayant plus de 300 lits.
SELECT hop.nom_hop
FROM   t_s204_service as serv
       INNER JOIN 
       t_s204_hopital as hop ON serv.idHop = hop.idHop
GROUP BY hop.idHop
HAVING   SUM(serv.nb_lits) > 300;



--   4. Les patients ayant consulté dans plusieurs hôpitaux.
SELECT pat.nom_pat,
       pat.prenom_pat,
       COUNT(DISTINCT med.idMed)

FROM   t_s204_patient  as pat
       INNER JOIN
       t_s204_consulte as con ON pat.idPat = con.idPat
       INNER JOIN
       t_s204_medecin  as med ON con.idMed = med.idMed

GROUP BY pat.idPat

HAVING COUNT(DISTINCT med.idMed) > 1;



--   5. Le nombre de lits par type de service pour l'ensemble des hôpitaux.
SELECT   SUM(nb_lits),
         nom_serv
FROM     t_s204_service
GROUP BY nom_serv;


--   6. Liste des noms des médecins et du nombre de patients examinés par médecin. La liste est triée
--   par ordre décroissant du nombre de patients.




--   7. Les noms des médecins ayant plus de patients que le médecin Firmin.




--   8. Les patients ayant fréquentés tous les services de l'hôpital Jacques Monod.




--   9. Les hôpitaux ayant les mêmes laboratoires que l'hôpital Jacques Monod





