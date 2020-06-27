# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(first_name:"Admin",last_name:"Istrator",email:"admin@user.com", password:"asdasdasd", password_confirmation:"asdasdasd")

User.create!(first_name:"User1",last_name:"User1",email:"user1@user.com", password:"asdasdasd", password_confirmation:"asdasdasd")
User.create!(first_name:"User2",last_name:"User2",email:"user2@user.com", password:"asdasdasd", password_confirmation:"asdasdasd")
User.create!(first_name:"User3",last_name:"User3",email:"user3@user.com", password:"asdasdasd", password_confirmation:"asdasdasd")


 