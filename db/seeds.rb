# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(admin_role: true,first_name:"Evren",last_name:"Nari",email:"admin@system.com", password:"12341234", password_confirmation:"12341234")

User.create!(user_role: true,first_name:"Thomas",last_name:"Anderson",email:"t_anderson@metacortex.com", password:"wheremorpheus@", password_confirmation:"wheremorpheus@")
User.create!(user_role: true,first_name:"Henry",last_name:"Case",email:"henry@case.com", password:"noway2gethigh", password_confirmation:"noway2gethigh")
User.create!(user_role: true,first_name:"Altiera",last_name:"Cunningham",email:"cunning-alt@hackmail.net", password:"silver5Johnny", password_confirmation:"silver5Johnny")


 