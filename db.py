# db.py model
import os
import pymysql
from flask import jsonify

db_user = os.environ.get('CLOUD_SQL_USERNAME')
db_password = os.environ.get('CLOUD_SQL_PASSWORD')
db_name = os.environ.get('CLOUD_SQL_DATABASE_NAME')
db_connection_name = os.environ.get('CLOUD_SQL_CONNECTION_NAME')


def open_connection():
    unix_socket = '/cloudsql/{}'.format(db_connection_name)
    try:
        if os.environ.get('GAE_ENV') == 'standard':
            conn = pymysql.connect(user=db_user,
                                   password=db_password,
                                   unix_socket=unix_socket,
                                   db=db_name,
                                   cursorclass=pymysql.cursors.DictCursor
                                   )
    except pymysql.MySQLError as e:
        return e
    return conn

def get_patient():
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT FirstName, LastName, Phone, Email FROM Patient ORDER BY FirstName DESC ;')
        Pat = cursor.fetchall()
        return Pat   

def get_patienthealth():
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT CONCAT(P.FirstName, " ", P.LastName) as PatName, CONCAT(D.FirstName, " ",  D.LastName) as DocName, D.Speciality, H.Hypertension, H.BMI, H.Smokingstatus, H.MajorEvent FROM Patient P INNER JOIN Health_relation H INNER JOIN Doctor D WHERE P.PatientID = H.PatientID AND P.DoctorID = D.DoctorID AND H.MajorEvent = 1 ORDER BY P.FirstName DESC ;')
        PatHlth = cursor.fetchall()
        return PatHlth  


def insert_patient(patientid, SSN, frstname, lstname, dob , phn, email, genre , wrktype, rsdtype, mrtsts, dctID, usrid):
    conn = open_connection()
    with conn.cursor() as cursor:
        
        #cursor.execute('INSERT INTO UserN (UserID, Username, Password) VALUES(%s, %s, %s)',
        #               (usrid, usrnme, pwd))
        cursor.execute('INSERT INTO Patient (PatientID, SSN, Firstname, Lastname, DOB, Phone, Gender, workType, ResidenceType, Email, MaritalStatus, UserID, DoctorID) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
                       (patientid, SSN, frstname, lstname, dob , phn,  genre , wrktype, rsdtype,email, mrtsts, usrid, dctID))
        
    conn.commit()
    conn.close()

def insert_user(usrid, usrnme, pwd):
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('INSERT INTO UserN (UserID, Username, Password) VALUES(%s, %s, %s)',
                       (usrid, usrnme, pwd))
    conn.commit()
    conn.close()

def get_user():
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT UserID, Username FROM UserN  ORDER BY UserID DESC;')
        user = cursor.fetchall()
        return user 

def get_docid():  
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT DoctorID FROM Doctor  ORDER BY DoctorID DESC;')
        doctor = cursor.fetchall()
        return doctor


def insert_dep(depid, depnme, depbldng, depfloor):
    conn = open_connection()
    with conn.cursor() as cursor:
        
        cursor.execute('INSERT INTO HDepartment(DeptID, Specialization, Building, BFloor) VALUES(%s, %s, %s, %s)',
                       (depid, depnme, depbldng, depfloor))
    conn.commit()
    conn.close()

def get_Dep():
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT * FROM HDepartment;')
        dep = cursor.fetchall()
        return dep