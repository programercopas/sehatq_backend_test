# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed master scedule, doctor, hospital
# Doctor.create([{ name: 'Dokter Lidya'}, {name: 'Dokter Andreas'}, {name: 'Dokter Riki'}])
# Hospital.create([{name: 'RSUD Soreang'}, {name: 'RSUD Bandung'}])
# Scedule.create([{hospital_id: 1, doctor_id: 1, scedule_time: '2020-10-25 17:00'},{hospital_id: 1, doctor_id: 2, scedule_time: '2020-10-25 16:00'},{hospital_id: 2, doctor_id: 3, scedule_time: '2020-10-25 16:00'}])