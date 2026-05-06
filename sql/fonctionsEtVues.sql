/**
  * Vues et fonctions
  * Date : 5 mai 2026
  * @author Jenny Richard, Antoine Bertin, Kyerann Cochaux
  */



-- 1. Créer une vue qui regroupe les médecins chercheurs (nom, mail, spécialité) et le nom
--   de leur hôpital.


drop view if exists medchnom;
create or replace view medchnom as

select med.nom_med,
       med.mail_med,
       med.spec,
       hop.nom_hop

from t_s204_medecin as med
     natural join
     t_s204_hopital as hop;


-- 2. Utiliser cette vue pour afficher les médecins chercheurs de l'hôpital Jacques Monod.

--select * from medchnom where nom_hop='Jacques Monod';



-- 3. Créer une vue contenant les premières consultations des patients (idPat,
--   premiere_date).

drop view if exists premconsult;
create or replace view premconsult as

select consult.idPat,
       min(consult.date_consult) as premiere_date

from t_s204_consulte as consult

group by consult.idPat;






-- 4. Utiliser cette vue pour écrire une fonction age_patient qui admet comme paramètre
--   l’identifiant du patient et qui retourne l’âge du patient à sa première consultation.


drop function if exists age_patient;

create or replace function age_patient(idPatv2 Integer)
returns Integer as $$

select (prm.premiere_date::date - pat.date_nais)/365

from t_s204_patient as pat
inner join premconsult as prm 
    on pat.idPat = prm.idpat

where pat.idPat = idPatv2;

$$ language sql;

-- 5. Écrire une requête qui donne la liste des consultations (nom du médecin, nom du
--   patient) des patients de plus de 40 ans. Utiliser la fonction age_patient.

select distinct med.nom_med,
                pat.nom_pat

from t_s204_medecin      as med
     natural join
     t_s204_consulte     as consult
     natural join
     t_s204_patient      as pat

where age_patient(pat.idPat) > 40;