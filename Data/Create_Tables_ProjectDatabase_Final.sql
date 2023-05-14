
SET FOREIGN_KEY_CHECKS=0;
drop table if exists HealthCarePerson;
drop table if exists Health_relation;
drop table if exists PatientEmergencyContact;
drop table if exists PatientAddress;
drop table if exists Patient;
drop table if exists Doctor;
drop table if exists HDepartment;
drop table if exists UserN;


CREATE TABLE UserN (
    UserID VARCHAR(50) PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50)

);


CREATE TABLE HDepartment (
    DeptID VARCHAR(50) PRIMARY KEY,
    Specialization VARCHAR(50),
    Building VARCHAR(50),
    BFloor VARCHAR(50) 
);

CREATE TABLE Doctor (
    DoctorID VARCHAR(50) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Speciality VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Gender VARCHAR(10),
    UserID VARCHAR(50) NOT NULL,
    DeptID VARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES UserN(UserID),
    FOREIGN KEY (DeptID) REFERENCES HDepartment(DeptID)
   
);



 

CREATE TABLE HealthCarePerson (
    HealthPersonID VARCHAR(50) PRIMARY KEY,
    HealthAffiliation VARCHAR(50),
    Phone VARCHAR(50),
    DeptID VARCHAR(50)  NOT NULL,
    UserID VARCHAR(50)  NOT NULL,
    FOREIGN KEY (UserID) REFERENCES UserN(UserID),
    FOREIGN KEY (DeptID) REFERENCES HDepartment(DeptID)   
);


CREATE TABLE Patient (
    PatientID VARCHAR(50) PRIMARY KEY,
    SSN VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Gender VARCHAR(10),
    workType VARCHAR(50),
    ResidenceType VARCHAR(50),
    Maritalstatus VARCHAR(50),
    UserID VARCHAR(50)  NOT NULL,
    DoctorID VARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES UserN(UserID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE PatientAddress (
    PatientID VARCHAR(50) PRIMARY KEY,
    HouseNumber VARCHAR(50),
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Zipcode VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
    ON DELETE CASCADE
);

CREATE TABLE PatientEmergencyContact (
    PatientID VARCHAR(50) PRIMARY KEY,
    Email VARCHAR(50),
    Contact VARCHAR(50),
    PhoneNumber VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);


CREATE TABLE Health_relation (
    HealthID INT PRIMARY KEY,
    Hypertension INT,
    Heartdisease INT,
    Glucoselevel INT,
    BMI INT,
    Smokingstatus VARCHAR(50),
    Majorevent INT,
    PatientID VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)

);



DELETE FROM UserN;

INSERT INTO UserN (UserID, Username, Password)
VALUES 
  ('1', 'lile', 'p@ssw0rd123'),
  ('2', 'emda', 'secret123'),
  ('3', 'nowi', 'password123'),
  ('4', 'olta', 'letmein123'),
  ('5', 'elja', 'qwerty123'),
  ('6', 'avma', 'iloveyou123'),
  ('7', 'wihe', '123456789'),
  ('8', 'soro', 'abcdef123'),
  ('9', 'jajo', 'summer123'),
  ('10', 'isan', 'football123'),
  ('11', 'beth', 'sunshine123'),
  ('12', 'mima', 'welcome123'),
  ('13', 'lucl', '123abcxyz'),
  ('14', 'chle', 'pass123word'),
  ('15', 'hewa', '123qweasd'),
  ('16', 'amha', 'iloveme123'),
  ('17', 'alwr', 'monkey123'),
  ('18', 'hatu', 'admin123'),
  ('19', 'mipa', 'dragon123'),
  ('20', 'abad', 'abc123456'),
  ('21', 'daca', 'letmein321'),
  ('22', 'emco', '1234abcd'),
  ('23', 'mane', 'iloveu123'),
  ('24', 'elca', '567890123'),
  ('25', 'dape', 'qazwsx123'),
  ('26', 'sarah_park', 'P@rkSarah123'),
  ('27', 'james_lee', 'L33James#'),
  ('28', 'emily_chen', 'Ch3nEmily!'),
  ('29', 'david_kim', 'K1mDavid$'),
  ('30', 'rachel_wong', 'W0ngRach#el'),
  ('31', 'daniel_rod', 'R0dDaniel$'),
  ('32', 'melissa_singh', 'SingMel1ssa!'),
  ('33', 'emma_j', 'Pa$$w0rd'),
  ('34', 'ethan_w', '3xample!'),
  ('35', 'olivia_b', 'Qwerty12'),
  ('36', 'noah_j', 'P@ssw0rd'),
  ('37', 'ava_g', '9!p0n3H#'),
  ('38', 'liam_r', 'P@$$word'),
  ('39', 'sophia_m', 's0m3pass'),
  ('40', 'mason_d', '4t#3f3m!'),
  ('41', 'isabella_h', 'Passw0rd!'),
  ('42', 'benjamin_w', 'b3nji3!'),
  ('43', 'mia_a', 'c0mpl3xP@ss'),
  ('44', 'elijah_t', 'R@inb0w#'),
  ('45', 'charlotte_j', 'Ch@rl!3!'),
  ('46', 'oliver_w', 'P@ssw0rd1'),
  ('47', 'amelia_h', 'Ame!ia123');


DELETE FROM HDepartment;

INSERT INTO HDepartment (DeptID, Specialization, Building, BFloor)
VALUES 
('D001', 'Cardiology', 'Main Building', '3rd Floor'),
('D002', 'Dermatology', 'East Wing', '2nd Floor'),
('D003', 'Pediatrics', 'West Wing', '1st Floor'),
('D004', 'Neurology', 'North Wing', '4th Floor'),
('D005', 'Oncology', 'South Wing', '5th Floor'),
('D006', 'Family Medicine', 'Main Building', '1st Floor'),
('D007', 'Ophthalmology', 'East Wing', '3rd Floor');

DELETE FROM Doctor;

INSERT INTO Doctor (DoctorID, FirstName, LastName, Speciality, Phone, Email, Gender, UserID, DeptID) 
VALUES 
('DR3456', 'Sarah', 'Park', 'Cardiology', '555-123-4567', 'sarah.park@medicalgroup.com', 'Female', '26', 'D001'),
('DR2345', 'James', 'Lee', 'Dermatology', '555-234-5678', 'james.lee@medicalgroup.com', 'Male', '27', 'D002'),
('DR7890', 'Emily', 'Chen', 'Pediatrics', '555-345-6789', 'emily.chen@medicalgroup.com', 'Female', '28', 'D003'),
('DR5678', 'David', 'Kim', 'Neurology', '555-456-7890', 'david.kim@medicalgroup.com', 'Male', '29', 'D004'),
('DR9012', 'Rachel', 'Wong', 'Oncology', '555-567-8901', 'rachel.wong@medicalgroup.com', 'Female', '30', 'D005'),
('DR4567', 'Daniel', 'Rodriguez', 'Family Medicine', '555-678-9012', 'daniel.rodriguez@medicalgroup.com', 'Male', '31', 'D006'),
('DR6789', 'Melissa', 'Singh', 'Ophthalmology', '555-789-0123', 'melissa.singh@medicalgroup.com', 'Female', '32', 'D007');


DELETE FROM HalthCarePerson;

INSERT INTO HealthCarePerson (HealthPersonID, HealthAffiliation, Phone, DeptID, UserID)
VALUES
('HP2345', 'Nurse', '(555) 123-4567', 'D001', '33'),
('HP3456', 'Doctor', '(555) 234-5678', 'D002', '34'),
('HP4567', 'Nurse', '(555) 345-6789', 'D003', '35'),
('HP5678', 'Health Admin', '(555) 456-7890', 'D004', '36'),
('HP6789', 'Researcher', '(555) 567-8901', 'D005', '37'),
('HP7890', 'Researcher', '(555) 678-9012', 'D006', '38'),
('HP8901', 'Doctor', '(555) 789-0123', 'D007', '39'),
('HP9012', 'Nurse', '(555) 890-1234', 'D001', '40'),
('HP2348', 'Nurse', '(555) 901-2345', 'D002', '41'),
('HP3459', 'Researcher', '(555) 012-3456', 'D003', '42'),
('HP4568', 'Health Admin', '(555) 123-4567', 'D004', '43'),
('HP5623', 'Nurse', '(555) 234-5678', 'D005', '44'),
('HP6781', 'Assistant', '(555) 345-6789', 'D006',' 45'),
('HP7892', 'Researcher', '(555) 456-7890', 'D007', '46'),
('HP8903', 'Nurse', '(555) 567-8901', 'D001', '47');




DELETE FROM Patient;

INSERT INTO Patient (PatientID, SSN, Firstname, Lastname, DOB, Phone, Gender, workType, ResidenceType, Email, MaritalStatus, UserID, DoctorID)
VALUES 
('74092', '307-15-8642', 'Liam',  'Lee', '3/14/86', '(123) 456-7890', 'Male', 'Sales', 'Apartment', 'liamlee@gmail.com', 'Married', '1', 'DR5678'),
('61924', '972-44-6790', 'Emma',  'Davis', '7/9/99', '(234) 567-8901', 'Female', 'Healthcare', 'House', 'emmadavis@gmail.com', 'Single', '2', 'DR9012'),
('29758', '019-62-8837', 'Noah',  'Wilson', '11/21/92', '(345) 678-9012', 'Male', 'Education', 'Condo', 'noahwilson@gmail.com', 'Divorced', '3', 'DR2345'),
('82741', '425-11-3968', 'Olivia', 'Taylor', '6/17/88', '(456) 789-0123', 'Female', 'Engineering', 'Townhouse', 'oliviataylor@gmail.com', 'Married', '4', 'DR3456'),
('53821', '684-24-7318', 'Elijah', 'Jackson', '12/26/80', '(567) 890-1234', 'Male', 'Information Tech', 'Duplex', 'elijahjackson@gmail.com', 'Single', '5', 'DR4567'),
('91385', '690-97-4059', 'Ava', 'Martinez', '9/23/74', '(678) 901-2345', 'Female', 'Legal', 'House', 'avamartinez@gmail.com', 'Married', '6', 'DR7890'),
('45783', '842-60-5963', 'William', 'Hernandez', '2/18/97', '(789) 012-3456', 'Female', 'Business', 'Apartment', 'williamhernandez@gmail.com', 'Divorced', '7', 'DR2345'),
('20648', '271-62-2830', 'Sophia', 'Rodriguez', '8/5/83', '(890) 123-4567', 'Male', 'Marketing', 'Condo', 'sophiarodriguez@gmail.com', 'Single', '8', 'DR5678'),
('13907', '127-42-8195', 'James', 'Johnson', '5/12/76', '(901) 234-5678', 'Male', 'Healthcare', 'Townhouse', 'jamesjohnson@gmail.com', 'Married', '9', 'DR4567'),
('81936', '515-98-4521', 'Isabella', 'Anderson', '10/27/95', '(012) 345-6789', 'Female', 'Sales', 'House', 'isabellaanderson@gmail.com', 'Single', '10', 'DR3456'),
('64237', '387-42-8561', 'Benjamin', 'Thomas', '4/4/87', '(123) 456-7890', 'Female', 'Engineering', 'Duplex', 'benjaminthomas@gmail.com', 'Married', '11', 'DR9012'),
('46829',	'276-56-0912',  'Mia',	'Martin','1/7/91','(234) 567-8901','Male','Information Tech','Apartment','miamartin@gmail.com',	'Single','12','DR6789'),
('38761',	'154-30-9784',  'Lucas', 'Clark', '9/15/85','(345) 678-9012','Female','Education','House','lucasclark@gmail.com','Married','13', 'DR3456'),
('17465', '845-62-0931',  'Charlotte','Lee',	'12/20/79','(456) 789-0123','Male','Business','Condo','charlottelee@gmail.com' ,'Single','14','DR7890'),
('85123',	'672-21-3845',  'Henry','Walker','5/1/98','(567) 890-1234','Female','Legal','Townhouse','henrywalker@gmail.com','Divorced','15','DR6789'),
('74358',	'307-15-8642',	'Amelia',	'Hall'	,        '7/2/82',	'(678) 901-2345',	'Male'	, 'Marketing'	, 'Apartment',	'ameliahall@gmail.com'	,'Married'	,'16'	,'DR5678'),
('92640',	'972-44-6790',	'Alexander',	'Wright',	'11/8/77',	'(789) 012-3456',	'Male'	, 'Healthcare',	  'Condo'	  ,      'alexanderwright@gmail.com',	'Single',	'17'	,'DR4567'),
('27584',	'019-62-8837',	'Harper',	'Turner',	'8/28/93',	'(123) 456-7890',	'Male'	, 'Sales'	,  'Apartment',	'harperturner@gmail.com',	'Married',	'18',	'DR2345'),
('74892',	'425-11-3968',	'Michael',	'Parker',	'1/23/84',	'(234) 567-8901' ,      'Female', 'Healthcare'	,   'House',	        'michaelparker@gmail.com',	'Single',	'19',	'DR9012'),
('58174',	'684-24-7318',	'Abigail',	'Adams'	 ,      '4/30/75',	'(345) 678-9012',       'Male'	, 'Education'	,'Condo'  ,       'abigailadams@gmail.com',	'Divorced'	,'20',	'DR6789'),
('93047',	'690-97-4059',	'Daniel',	'Campbell',	'3/9/94',	'(456) 789-0123',	'Female' ,'Engineering',	'Townhouse',	'danielcampbell@gmail.com',	'Married',	'21'	,'DR3456'),
('42058',	'842-60-5963',	'Emily'	 ,       'Collins',	'2/11/89',	'(567) 890-1234',	'Male'	 ,'Info Tech',	'Duplex',	'emilycollins@gmail.com'	,'Single',	'22',	'DR7890'),
('21693',	'271-62-2830',	'Matthew',	'Nelson',	'6/26/81',	'(678) 901-2345',	'Female'  ,'Legal'	,'House',	        'matthewnelson@gmail.com',	'Married',	'23'	,'DR2345'),
('83095',	'127-42-8195',	'Elizabeth',	'Carter',	'9/13/90',	'(789) 012-3456',	'Female'  ,'Business'	,'Apartment',	'elizabethcarter@gmail.com'	,'Divorced',	'24'	,'DR5678'),
('51698',	'515-98-4521',	'David'	  ,       'Perez',	'4/19/78',	'(890) 123-4567',	'Male'	 ,  'Marketing'	,'Condo',	        'davidperez@gmail.com'  ,	'Single',	'25',	'DR4567');


DELETE FROM PatientAddress;

INSERT INTO PatientAddress (PatientID, HouseNumber, Street, City, State, Zipcode)
VALUES
  ('74092', '123', 'Main St', 'Denver', 'CO', '80204'),
  ('61924', '456', 'Elm St', 'Chicago', 'IL', '60607'),
  ('29758', '789', 'Oak St', 'San Francisco', 'CA', '94109'),
  ('82741', '1010', 'Pine St', 'New York', 'NY', '10005'),
  ('53821', '1313', 'Maple Ave', 'Austin', 'TX', '78702'),
  ('91385', '1515', 'Cedar St', 'Boston', 'MA', '2114'),
  ('45783', '1717', 'Birch St', 'Seattle', 'WA', '98101'),
  ('20648', '1920', 'Ash St', 'Miami', 'FL', '33130'),
  ('13907', '2222', 'Elmwood Rd', 'Portland', 'OR', '97210'),
  ('81936', '2424', 'Linden Blvd', 'Philadelphia', 'PA', '19103'),
  ('64237', '2727', 'Willow Ave', 'Atlanta', 'GA', '30305'),
  ('46829', '3030', 'Oakwood Dr', 'Houston', 'TX', '77006'),
  ('38761', '3333', 'Hilltop Rd', 'Washington D.C.', 'DC', '20005'),
  ('17465', '3636', 'Lakeshore Dr', 'San Diego', 'CA', '92109'),
  ('85123', '3939', 'Pineapple St', 'Honolulu', 'HI', '96815'),
  ('74358', '4242', 'Cherry St', 'Nashville', 'TN', '37203'),
  ('92640', '4545', 'Magnolia Blvd', 'Las Vegas', 'NV', '89109'),
  ('27584', '4848', 'Sunset Dr', 'New Orleans', 'LA', '70116'),
  ('74892', '5151', 'Ocean Ave', 'Miami Beach', 'FL', '33139'),
  ('58174', '5454', 'Meadowbrook Ln', 'Dallas', 'TX', '75201'),
  ('93047', '5757', 'Parkview Blvd', 'Los Angeles', 'CA', '90023'),
  ('42058', '6060', 'Spring St', 'Minneapolis', 'MN', '55402'),
  ('21693', '6363', 'Park Ave', 'Chicago', 'IL', '60611'),
  ('83095', '6666', 'Maplewood Dr', 'Charlotte', 'NC', '28202'),
  ('51698', '6969', 'Cedarwood Rd', 'San Francisco', 'CA', '94102');


DELETE FROM PatientEmergencyContact;

INSERT INTO PatientEmergencyContact (PatientID, Email, Contact, PhoneNumber) VALUES 
('74092', 'johnsmith@example.com', 'Jane Doe', '(234)567-8901'),
('61924', 'janedoe@example.com', 'John Smith', '(123)456-7890'),
('29758', 'johndoe@example.com', 'Sarah Lee', '(456)789-0123'),
('82741', 'sarahlee@example.com', 'John Doe', '(345)678-9012'),
('53821', 'jamesbrown@example.com', 'Amy Green', '(678)901-2345'),
('91385', 'amygreen@example.com', 'James Brown', '(567)890-1234'),
('45783', 'sarahjones@example.com', 'David Kim', '(890)123-4567'),
('20648', 'davidkim@example.com', 'Sarah Jones', '(789)012-3456'),
('13907', 'christopherdavis@example.com', 'Emily Wilson', '(012)345-6789'),
('81936', 'emilywilson@example.com', 'Christopher Davis', '(901)234-5678'),
('64237', 'ashleybrown@example.com', 'Michael Lee', '(234)567-8901'),
('46829', 'michaellee@example.com', 'Ashley Brown', '(123)456-7890'),
('38761', 'laurasmith@example.com', 'Brian Johnson', '(456)789-0123'),
('17465', 'brianjohnson@example.com', 'Laura Smith', '(345)678-9012'),
('85123', 'melissawilliams@example.com', 'Jason Davis', '(567)890-1234'),
('74358', 'jasondavis@example.com', 'Melissa Williams', '(678)901-2345'),
('92640', 'michaelscott@example.com', 'Pam Beesly', '(789)012-3456'),
('27584', 'johnsmith@example.com', 'Jane Doe', '(234)567-8901'),
('74892', 'janedoe@example.com', 'John Smith', '(123)456-7890'),
('58174', 'johndoe@example.com', 'Sarah Lee', '(456)789-0123'),
('93047', 'sarahlee@example.com', 'John Doe', '(345)678-9012'),
('42058', 'jamesbrown@example.com', 'Amy Green', '(678)901-2345'),
('21693', 'amygreen@example.com', 'James Brown', '(567)890-1234'),
('83095', 'sarahjones@example.com', 'David Kim', '(890)123-4567'),
('51698', 'davidkim@example.com', 'Sarah Jones', '(789)012-3456');




DELETE FROM Health_relation;

INSERT INTO Health_relation (HealthID, Hypertension, Heartdisease, Glucoselevel, BMI, Smokingstatus, MajorEvent, PatientID) 
VALUES 
(9046, 0, 1, 228.69, 36.6, 'formerly smoked', 1, '74092'),
(31112, 0, 1, 105.92, 32.5, 'never smoked', 1, '61924'),
(60182, 0, 0, 171.23, 34.4, 'smokes', 1, '29758'),
(1665, 1, 0, 174.12, 24, 'never smoked', 1, '82741'),
(56669, 0, 0, 186.21, 29, 'formerly smoked', 1, '53821'),
(53882, 1, 1, 70.09, 27.4, 'never smoked', 1, '91385'),
(10434, 0, 0, 94.39, 22.8, 'never smoked', 1, '45783'),
(60491, 0, 0, 58.57, 24.2, 'Unknown', 1, '20648'),
(12109, 1, 0, 80.43, 29.7, 'never smoked', 1, '13907'),
(12095, 0, 1, 120.46, 36.8, 'smokes', 1, '81936'),
(12175, 0, 0, 104.51, 27.3, 'smokes', 1, '64237'),
(5317, 0, 1, 214.09, 28.2, 'never smoked', 1, '46829'),
(58202, 1, 0, 167.41, 30.9, 'never smoked', 1, '38761'),
(56112, 0, 1, 191.61, 37.5, 'smokes', 1,'17465'),
(34120, 1, 0, 221.29, 25.8, 'smokes', 1, '85123'),
(27458, 0, 0, 89.22, 37.8, 'never smoked', 1, '74358'),
(70630, 0, 0, 193.94, 22.4, 'smokes', 1, '92640'),
(13861, 1, 0, 233.29, 48.9, 'never smoked', 1, '27584'),
(68794, 0, 0, 228.7, 26.6, 'never smoked', 1, '74892'),
(64778, 0, 1, 208.3, 32.5, 'Unknown', 1, '58174'),
(4219, 0, 0, 102.87, 27.2, 'formerly smoked', 1, '93047'),
(70822, 0, 0, 104.12, 23.5, 'never smoked', 1, '42058'),
(38047, 0, 0, 100.98, 28.2, 'formerly smoked', 1, '21693'),
(54827,	0, 1, 195.23, 28.3, 'smokes',1,'83095'),
(39373, 1,0, 196.92, 22.2, 'never smoked',1, '51698');

SET FOREIGN_KEY_CHECKS=0;
