/**
  * Vues et fonctions
  * Date : 5 mai 2026
  * @author Jenny Richard, Antoine Bertin, Kyerann Cochaux
  */



-- 1. Créer une vue qui regroupe les médecins chercheurs (nom, mail, spécialité) et le nom
--   de leur hôpital.


DROP VIEW IF EXISTS medchnom;
CREATE OR REPLACE VIEW medchnom AS

SELECT med.nom_med,
       med.mail_med,
       med.spec,
       hop.nom_hop

FROM t_s204_medecin AS med
     NATURAL JOIN
     t_s204_hopital AS hop;


-- 2. Utiliser cette vue pour afficher les médecins chercheurs de l'hôpital Jacques Monod.

--SELECT * FROM medchnom where nom_hop='Jacques Monod';



-- 3. Créer une vue contenant les premières consultations des patients (idPat,
--   premiere_date).

DROP VIEW IF EXISTS premconsult;
CREATE OR REPLACE VIEW premconsult AS

SELECT consult.idPat,
       MIN(consult.date_consult) AS premiere_date

FROM t_s204_consulte AS consult

GROUP BY consult.idPat;






-- 4. Utiliser cette vue pour écrire une fonction age_patient qui admet comme paramètre
--   l’identifiant du patient et qui retourne l’âge du patient à sa première consultation.


DROP FUNCTION IF EXISTS age_patient;

CREATE OR REPLACE FUNCTION age_patient(idPatv2 INTEGER)
returns INTEGER AS $$

SELECT (prm.premiere_date::DATE - pat.date_nais)/365

FROM t_s204_patient AS pat
        INNER JOIN premconsult AS prm 
            ON pat.idPat = prm.idpat

WHERE pat.idPat = idPatv2;

$$ LANGUAGE SQL;

-- 5. Écrire une requête qui donne la liste des consultations (nom du médecin, nom du
--   patient) des patients de plus de 40 ans. Utiliser la fonction age_patient.

SELECT DISTINCT med.nom_med,
                pat.nom_pat

FROM t_s204_medecin      AS med
     NATURAL JOIN
     t_s204_consulte     AS consult
     NATURAL JOIN
     t_s204_patient      AS pat

where age_patient(pat.idPat) > 40;