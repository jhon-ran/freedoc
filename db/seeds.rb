# 6 tables with their respective seeds
# Use rails db:seed to charge the data
# Then, rails console to see them on terminal
# If wanna increase the # of seeds modify .times in each of the loops accordingly.

require 'faker'
Doctor.destroy_all 
Patient.destroy_all
Appointment.destroy_all

# Seed for table Doctor
10.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
  zip_code: Faker::Address.zip_code)
end

# Seed for table Patient
10.times do
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

# Seed for table Appointment
10.times do
  d = Doctor.order("RANDOM()").limit(1).ids[0]
  p = Patient.order("RANDOM()").limit(1).ids[0]
  #c = City.order("RANDOM()").limit(1).ids[0]
  Appointment.create!(
    doctor_id: d ,
    patient_id: p,
    #city_id: c,
    date: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now)
  )
end

# Seed for table City
10.times do
  my_doctor = Doctor.find(Doctor.pluck(:id).shuffle.first)
  my_patient = Patient.find(Patient.pluck(:id).shuffle.first)
  my_appointment = Appointment.find(Appointment.pluck(:id).shuffle.first)
  city = City.create!(city: Faker::Address.city, doctor: my_doctor, patient: my_patient, appointment: my_appointment)
end

# Seed for Specialty
10.times do
  my_specialty = Specialty.create!(specialty: Faker::Educator.subject)
end

# Seed for Doctor Specialty
10.times do
  my_doctor = Doctor.find(Doctor.pluck(:id).shuffle.first)
  my_specialty = Specialty.find(Specialty.pluck(:id).shuffle.first)
  doctor_specialty = DoctorSpecialty.create!(doctor: my_doctor, specialty: my_specialty)
end
