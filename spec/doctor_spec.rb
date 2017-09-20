require 'spec_helper'

RSpec.describe(Doctor) do

  describe(".all") do
    it "will be empty at first" do
      expect(Doctor.all()).to eq([])
    end
  end

  describe("#==") do
    it "will compare two doctors; they will share the same name and id" do
      dr_wong = Doctor.new({:name => "Wontong", :specialty => "nuerosurgeon", :id => nil})
      dr_wong2 = Doctor.new({:name => "Wontong", :specialty => "nuerosurgeon", :id => nil})
      expect(dr_wong).to eq(dr_wong2)
    end
  end

  describe('.save') do
    it "will save info to database" do
      dr_phil = Doctor.new({:name => "Philip", :specialty => "orthopedics", :id => nil})
      dr_phil.save
      expect(Doctor.all()).to eq([dr_phil])
    end
  end

  describe('.find') do
    it "return id from doctor" do
      doctor_id1 = Doctor.new({:name=> "charlie", :specialty=>"faces", :id=>nil})
      doc1_save = doctor_id1.save
      expect(Doctor.find(doc1_save)).to(eq(Doctor.new({:name=> "charlie", :specialty=>"faces", :id=>doc1_save})))
    end
  end

  describe('#patients') do
    it "will pull the patients belonging to the doctor" do
      house = Doctor.new({:name => "House", :specialty => "M.D.", :id => nil})
      doc_house_id = house.save # Doctor SAVE
      walter = Patient.new({:name => "Little Walter", :birthday => "2005-08-25", :doctor_id => doc_house_id})
      walter.save # Patient SAVE
      dr_house = Doctor.find(doc_house_id.to_i)
      expect(dr_house.patients).to eq([walter])
    end
  end

  describe("#update") do
    it("update doctors") do
      doctor1= Doctor.new({:name=>"Miguel", :speicalty=> "orthopedics", :id=> nil})
      doctor1.save()
      doctor1.update({:name=>"Clarence", :specialty=>"M.D"})
      expect(doctor1.name).to(eq("Clarence"))
    end
  end

  describe("#delete") do
    it("lets you delete a doctor from the database") do
      doctor = Doctor.new({:name => "Smarg",:specialty => "huffing", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Huffbord",:specialty => "smarging", :id => nil})
      doctor2.save()
      doctor.delete()
      expect(Doctor.all()).to(eq([doctor2]))
    end

    it("deletes a doctor's patients from the database") do
      doctor = Doctor.new({:name => "Smarg",:specialty => "huffing", :id => nil})
      doctor.save()
      patient = Patient.new({:name => "Guy Man",:birthday => "1940-03-10", :doctor_id => doctor.id()})
      patient.save()
      patient2 = Patient.new({:name => "Steve Jenkins",:birthday => "1980-04-10", :doctor_id => doctor.id()})
      patient2.save()
      doctor.delete()
      expect(Patient.all()).to(eq([]))
    end
  end
end
