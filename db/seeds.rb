# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
Doctor.destroy_all 
Patient.destroy_all
Appointment.destroy_all

# Seed for table Doctor
my_specialty = ["Oncology", "Pediatrics", "Dermatology", "Cardiology", "Gynecologist"]

10.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
  specialty: my_specialty[rand(my_specialty.length)],zip_code: Faker::Address.zip_code)
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


#  Doctor.destroy_all

# full_name: Faker::Book.author
# first_name: Faker::Name.first_name,
# last_name: Faker::Name.last_name,
# Faker::Number.between(from: 1900, to: 2020)

# Doctor.clear_cache!