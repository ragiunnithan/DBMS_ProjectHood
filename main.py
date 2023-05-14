# main.py controller
from flask import Flask, redirect, request, url_for, render_template, jsonify

from db import get_patient,get_patienthealth, insert_patient, insert_user, get_user, get_docid, insert_dep, get_Dep
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
def InsertNewPatient():
    #docid = get_docid()
    #label_text = docid
    return render_template('InsertNewPatient.html')

@app.route('/AddNewPatient', methods=['POST'])#This needs to be same as the function name in action section for insert_customer.html
def AddNewPatient():
    insert_user(request.form['usrid'], request.form['usrnme'], request.form['pwd'])

    insert_patient(request.form['patientid'], request.form['SSN'], request.form['frstname'], request.form['lstname'], request.form['dob'],
    request.form['phn'], request.form['email'], request.form['gender'], request.form['wrktype'], request.form['rsdtype'],
    request.form['mrtsts'], request.form['docid'], request.form['usrid'])
    
    return redirect(url_for('Patients'))

     

##This function will get all the Patients information from database
##and will display it on an html page
@app.route('/Patients')
def Patients():
    patients = get_patient() ##Function for getting all the information of patient from the database
    return render_template('Patients.html', patients = patients) 




@app.route('/InsertNewDep')#This needs to be same as the href in the layout.html
def InsertNewDep():
    return render_template('InserNewDepartment.html')


@app.route('/AddNewDepartment', methods=['POST'])#This needs to be same as the function name in action section for insert_customer.html
def AddNewDepartment():
    insert_dep(request.form['depid'], request.form['depnme'], request.form['depbldng'], request.form['depfloor'])
    return redirect(url_for('DisplayDep'))

    
@app.route('/DisplayDep')
def DisplayDep():
    AllDep = get_Dep() ##Function for getting all the information of patient from the database
    return render_template('DisplayDep.html', DepInfo = AllDep) 

    

if __name__ == '__main__':
    app.run(debug=True)
