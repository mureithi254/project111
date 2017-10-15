require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[Admin,Staff].each(&:delete_all)

# Admin.populate 20 do |person|
#   person.first_name = Faker::Name.first_name
#   person.last_name = Faker::Name.last_name
#   person.username = Faker::Name.name
#   person.email = Faker::Internet.email
#   person.password = "123456789"
# end

# Staff.populate 100 do |staff|
#   staff.first_name = Faker::Name.first_name
#   staff.last_name = Faker::Name.last_name
#   staff.email = Faker::Internet.email
#   staff.username = Faker::Name.name
#   staff.phone_number = Faker.PhoneNumber.cell_phone
#   staff.password = "123456789" 
# end

20.times do 
   Admin.create([{
   	    first_name:  Faker::Name.first_name,
   	    last_name: Faker::Name.last_name,
   	    username: Faker::Name.name,
   	    email:  Faker::Internet.email,
   	    password: "123456789"
   	}])

end

100.times do 
   Staff.create([{
   	   first_name:  Faker::Name.first_name,
   	   last_name: Faker::Name.last_name,
   	   email:  Faker::Internet.email,
       username: Faker::Name.name,
       password: "123456789"
   	}])
end