class Patient

  attr_reader :name, :birthday, :doctor_id

  def initialize(attributes)
    @name = attributes[:name]
    @birthday = attributes[:birthday]
    @doctor_id = attributes[:doctor_id]
  end

  def self.all
    queried_patients = DB.exec("SELECT * FROM patientés;")
    patients = []
    queried_patients.each do |patient|
      name = patient["name"]
      birthday = patient["birthday"]
      doctor_id = patient["doctor_id"].to_i
      patients.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id}))
    end
    patients
  end

  def ==(another_patient)
    self.name.==(another_patient.name) and self.birthday.==(another_patient.birthday) and self.doctor_id.==(another_patient.doctor_id)
  end

  def save
    DB.exec("INSERT INTO patientés (name, birthday, doctor_id) VALUES ('#{@name}', '#{@birthday}', #{@doctor_id});")
  end
end
