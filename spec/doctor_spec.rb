require 'spec_helper'

RSpec.describe(Doctor) do

  describe(".all") do
    it "will be empty at first" do
      expect(Patient.all()).to eq([])
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
end
