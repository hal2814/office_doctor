require "rspec"
require "pg"
require "patient"
require "doctor"

DB = PG.connect({:dbname => "doctors_office_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patientés *;")
    DB.exec("DELETE FROM doctorés *;")
    # DB.exec('ALTER SEQUENCE "doctorés_id_seq" RESTART WITH 1;');
  end
end
