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
end
