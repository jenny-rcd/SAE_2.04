/*2. Noms des hôpitaux qui ont un service de Cardiologie*/

select nom_hop

from t_s204_hopital join t_s204_service using(idHop)

where nom_serv = 'Cardiologie';

/*3. Les noms des laboratoires de l’hôpital Jacques Monod.*/

select nom_lab

from t_s204_laboratoire join t_s204_hopital using(idHop)

where nom_hop = 'Jacques Monod';

/*4. Noms des patients ayant consulté un gynécologue.*/

select nom_pat

from t_s204_patient join t_s204_consulte using(idPat) join t_s204_medecin using (idMed)

where spec = 'Gynécologue';

/*5. Liste des consultations de médecins (nom du médecin, nom du patient et la date de
consultation).*/

select nom_med,
	   nom_pat,
	   date_consult

from t_s204_patient join t_s204_consulte using(idPat) join t_s204_medecin using (idMed);


/*6. Noms des patients ayant consulté un médecin consultant indépendant à l'hôpital Jacques
Monod.*/

select nom_pat

from t_s204_patient join t_s204_consulte using(idPat) join t_s204_medecin using (idMed) join t_s204_hopital using (idHop)

where fct = 'CONSULTANT' and nom_hop ='Jacques Monod';

/*7. Noms des patients n'ayant consulté qu'à l'hôpital Jacques Monod.*/

select nom_pat

from t_s204_patient

except

select nom_pat

from t_s204_patient join t_s204_consulte using(idPat) join t_s204_medecin using (idMed) join t_s204_hopital using (idHop)

where nom_hop != 'Jacques Monod';


