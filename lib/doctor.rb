class Doctor

  attr_reader :name, :specialty, :id

  def initialize(attributes)
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @id = attributes[:id]
  end

  def self.all
    queried_doctors = DB.exec("SELECT * FROM doctorés;")
    doctors = []
    queried_doctors.each do |doctor|
      name = doctor["name"]
      specialty = doctor["specialty"]
      id = doctor["id"].to_i
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors
  end

  def self.find(id)
    Doctor.all().each do |doctor|
      if doctor.id().==(id)
        return doctor
      end
    end
    return nil
  end

  def ==(another_doctor)
    self.name.==(another_doctor.name) and self.specialty.==(another_doctor.specialty) and self.id.==(another_doctor.id)
  end

  def update(attributes)
    @name= attributes.fetch(:name)
    @specialty= attributes.fetch(:specialty)
    @id= self.id()
    DB.exec("UPDATE doctorés SET (name, specialty) = ('#{@name}', '#{@specialty}') WHERE id = #{@id};")
  end

  def patients
    doctor_patients = []
    patients = DB.exec("SELECT * FROM patientés WHERE doctor_id = #{self.id};")
    patients.each do |patient|
      name = patient["name"]
      birthday = patient["birthday"]
      doctor_id = patient["doctor_id"].to_i
      doctor_patients.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id}))
    end
    doctor_patients
  end

  def save
    @id = DB.exec("INSERT INTO doctorés (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;").first().fetch("id").to_i()
  end
end
