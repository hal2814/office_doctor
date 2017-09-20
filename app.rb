require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
also_reload('lib/**/*.rb')
require("pg")

# Uncomment for testing integration_spec...maybe....
# DB = PG.connect({:dbname => "doctors_office_test"})
DB = PG.connect({:dbname => "doctors_office"})

get('/') do
  @doctors = Doctor.all
  erb(:index)
end

get('/new_doctor') do
  erb(:add_doc)
end

get('/doctors/:id') do
  @doctor = Doctor.find(params["id"].to_i)
  erb(:doc)
end


post('/new_doctor') do
  dr_phil = Doctor.new({:name => params["name"], :specialty => params["specialty"], :id => nil})
  dr_phil.save
  redirect('/')
end

get('/new_patient_for_:id') do
  @doctor = Doctor.find(params["id"].to_i)
  erb(:add_patient)
end

post('/new_patient')do
  patient = Patient.new({:name => params["name"], :birthday => params["birthday"], :doctor_id => params["doctor_id"]})
  patient.save
  redirect('/doctors/'+params["doctor_id"])
end
