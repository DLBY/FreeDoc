# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Specialty.destroy_all

30.times do
  city = City.create!(name: Faker::Address.city)
end

30.times do
  doctor = Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city_id: City.all.sample.id
  )
end

Specialty.create!(specialty: "Généraliste")
Specialty.create!(specialty: "Podologue")
Specialty.create!(specialty: "Cardiologue")
Specialty.create!(specialty: "Ophtalmologue")
Specialty.create!(specialty: "Dermatologue")

30.times do
  patient = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.all.sample.id
  )
end

30.times do
  appointment = Appointment.create!(
    doctor: Doctor.all.sample,
    patient: Patient.all.sample,
    doctor_id: Doctor.all.sample.id,
    patient_id: Patient.all.sample.id,
    city_id: City.all.sample.id,
    date: Faker::Time.between_dates(from: Date.today, to: Date.today + 200, period: :all))
  end

30.times do
    join = JoinTableSpecialty.create!(doctor: Doctor.all.select(:id).sample, specialty: Specialty.all.select(:id).sample)
end