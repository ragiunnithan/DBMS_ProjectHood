# main.py controller
from flask import Flask, redirect, request, url_for, render_template, jsonify
from db import get_patient,get_patienthealth, insert_patient, insert_user, get_user
app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/about')
def about():
    return render_template('about.html') 




##This function will get all the Patients information from database
##and will display it on an html page
@app.route('/PatientHealthInfo')
def PatientHealthInfo():
    pthlthinfo = get_patienthealth() ##Function for getting all the information of patient from the database
    return render_template('PatientHealthInfo.html', HealthInfo = pthlthinfo) 

@app.route('/InsertNewPatient')#This needs to be same as the href in the layout.html
def InsertNewPat():
    return render_template('InserNewPatient.html')

@app.route('/AddNewPatient', methods=['POST'])#This needs to be same as the function name in action section for insert_customer.html
def AddNewPatient():
    insert_patient(request.form['patientid'], request.form['SSN'], request.form['frstname'], request.form['lstname'], request.form['dob'],
    request.form['phn'], request.form['email'], request.form['genre'], request.form['wrktype'], request.form['rsdtype'],
    request.form['mrtsts'], request.form['usrID'], request.form['dctID'])
    return redirect('/Patients')

##This function will get all the Patients information from database
##and will display it on an html page
@app.route('/Patients')
def Patients():
    patients = get_patient() ##Function for getting all the information of patient from the database
    return render_template('Patients.html', patients = patients) 




@app.route('/InsertNewUser')#This needs to be same as the href in the layout.html
def InsertNewUser():
    return render_template('InserNewUser.html')


@app.route('/AddNewUser', methods=['POST'])#This needs to be same as the function name in action section for insert_customer.html
def AddNewUser():
    insert_user(request.form['usrid'], request.form['usrnme'], request.form['pwd'])
    return redirect('/DisplayAllUsers')

    
@app.route('/DisplayAllUsers')
def DisplayAllUsers():
    users = get_user() ##Function for getting all the information of patient from the database
    return render_template('DisplayUser.html', UserInfo = users) 

    

if __name__ == '__main__':
    app.run(debug=True)
