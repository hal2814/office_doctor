# Doctor's Office Administrative Application

#### By _**Dawson Mortenson & Noah Gottlieb :sparkles:**_

### This application provides the follow functionality ("user stories"):
* As an administrator, I want to add a doctor to the database with a name and specialty.
* As an administrator, I want to add a patient with their name and birthdate.
* As an administrator, I want to be able to assign a patient to a doctor for care. (Hint: Doctors will have a one-to-many relationship with their patients.)
* As a doctor, I want to see the list of patients that have been assigned to me.

### Setup (IMPORTANT: This application require a local postgres server to be running)
1. Clone the project and run `bundle`
2. run `psql` in a terminal to create the db structure.
3. run `CREATE DATABASE doctors_office`
4. `CREATE TABLE doctorés (id serial PRIMARY KEY, name varchar, specialty varchar);` MUST BE 'doctorés'
5. run `CREATE table patientés (id serial primary key,  name varchar, birthday date, doctor_id int);` MUST BE 'patientés'
6. To run the specs you need to: `CREATE DATABASE doctors_office_test WITH TEMPLATE doctors_office;` MUST BE 'doctors_office_test'
7. In separate terminal tab/window start up the app by running `ruby app.rb` :rocket:

### Technologies Used
_HTML, CSS, Bootstrap, Sinatra, Ruby, Postgres, :octocat:_

### License

Copyright (c) 2017 **_Dawson Mortenson & Noah Gottlieb_**
