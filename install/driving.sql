INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_drivingschool', 'Driving School', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_drivingschool', 'Driving School', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_drivingschool', 'Driving School', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('drivingschool', 'Driving School')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('drivingschool',0,'recruit','Recrue',20,'{}','{}'),
	('drivingschool',1,'officer','Officier',40,'{}','{}'),
	('drivingschool',2,'sergeant','Sergent',60,'{}','{}'),
	('drivingschool',3,'lieutenant','Lieutenant',85,'{}','{}'),
	('drivingschool',4,'boss','Commandant',100,'{}','{}');
;