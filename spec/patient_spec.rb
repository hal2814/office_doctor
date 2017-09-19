require 'spec_helper'

RSpec.describe(Patient) do
  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to eq([])
    end
  end
  describe("#==") do
    it("will have the same patients. They will share the same name, bday, and doctor_id") do
    patient1= Patient.new({:name=> "Gregory", :birthday => "1967-05-13", :doctor_id=>1})
    patient2= Patient.new({:name=> "Gregory", :birthday => "1967-05-13", :doctor_id=>1})
    expect(patient1).to eq(patient2)
    end
  end
  describe("#save") do
    it("will insert a patient into the patientés table") do
      patient1 = Patient.new({:name => "McGregor", :birthday => "1967-05-13", :doctor_id => 1})
      patient1.save
      expect(Patient.all).to eq([patient1])
    end
  end
end
