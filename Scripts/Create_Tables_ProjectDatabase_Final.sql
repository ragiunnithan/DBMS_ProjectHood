
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
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50)

);


CREATE TABLE HDepartment (
    DeptID INT PRIMARY KEY,
    Specialization VARCHAR(50),
    Building VARCHAR(50),
    Floor VARCHAR(50) 
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Speciality VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Gender VARCHAR(10),
    UserID INT NOT NULL,
    DeptID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES UserN(UserID),
    FOREIGN KEY (DeptID) REFERENCES HDepartment(DeptID)
   
);



 

CREATE TABLE HealthCarePerson (
    HealthPersonID INT PRIMARY KEY,
    HealthAffiliation VARCHAR(50),
    Phone VARCHAR(50),
    DeptID INT  NOT NULL,
    UserID INT  NOT NULL,
    FOREIGN KEY (UserID) REFERENCES UserN(UserID),
    FOREIGN KEY (DeptID) REFERENCES HDepartment(DeptID)   
);


CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    SSN VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Gender VARCHAR(10),
    workType VARCHAR(50),
    ResidenceType VARCHAR(50),
    Maritalstatus VARCHAR(50),
    UserID INT  NOT NULL,
    DoctorID INT  NOT NULL,
    FOREIGN KEY (UserID) REFERENCES UserN(UserID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE PatientAddress (
    PatientID INT PRIMARY KEY,
    HouseNumber VARCHAR(50),
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Zipcode VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
    ON DELETE CASCADE
);

CREATE TABLE PatientEmergencyContact (
    PatientID INT PRIMARY KEY,
    Email VARCHAR(50),
    Contact VARCHAR(50),
    PhoneNumber VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);


CREATE TABLE Health_relation (
    HealthID INT PRIMARY KEY,
    Hypertension VARCHAR(50),
    Heartdisease VARCHAR(50),
    Glucoselevel VARCHAR(50),
    BMI VARCHAR(50),
    Smokingstatus VARCHAR(50),
    Majorevent VARCHAR(50),
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)

);



DELETE FROM UserN;

LOAD DATA LOCAL INFILE 'UserN.csv'
INTO TABLE UserN
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


DELETE FROM HDepartment;

LOAD DATA LOCAL INFILE 'Department.csv'
INTO TABLE HDepartment
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DELETE FROM Doctor;

LOAD DATA LOCAL INFILE 'Doctor.csv'
INTO TABLE Doctor
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


DELETE FROM HealthCarePerson;

LOAD DATA LOCAL INFILE 'HealthCarePerson.csv'
INTO TABLE HealthCarePerson
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



DELETE FROM Patient;

LOAD DATA LOCAL INFILE 'Patient.csv'
INTO TABLE Patient
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



DELETE FROM PatientAddress;

LOAD DATA LOCAL INFILE 'PatientAddress.csv'
INTO TABLE PatientAddress
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


DELETE FROM PatientEmergencyContact;

LOAD DATA LOCAL INFILE 'PatientEmergencyContact.csv'
INTO TABLE PatientEmergencyContact
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SET FOREIGN_KEY_CHECKS=0;





