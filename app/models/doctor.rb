class Doctor < ApplicationRecord
  has_many :appointments
  has_many :cities
  has_many :patients, through: :appointments
  has_many :specialties, through: :doctor_specialty
end
