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