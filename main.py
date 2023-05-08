# main.py controller
from flask import Flask, render_template
from db import get_patient,get_patienthealth
app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/about')
def about():
    return render_template('about.html') 


##This function will get all the Patients information from database
##and will display it on an html page
@app.route('/Patients')
def Patients():
    patients = get_patient() ##Function for getting all the information of patient from the database
    return render_template('Patients.html', patients = patients) 



##This function will get all the Patients information from database
##and will display it on an html page
@app.route('/PatientHealthInfo')
def PatientHealthInfo():
    pthlthinfo = get_patienthealth() ##Function for getting all the information of patient from the database
    return render_template('PatientHealthInfo.html', HealthInfo = pthlthinfo) 



if __name__ == '__main__':
    app.run(debug=True)
