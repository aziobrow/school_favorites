# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

District.destroy_all

DISTRICTS = [{"District 1" => "Anne Rowe"},
  {"District 2" => "Rosemary Rodriguez"},
  {"District 3" => "Mike Johnson"},
  {"District 4" => "Rachele Espiritu"},
  {"District 5" => "Lisa Flores"}]

DISTRICTS.each do |district_info|
  district_info.each do |k,v|
    district = District.create(name: "#{k}", board_member: "#{v}")
    puts "Created #{district.name}"
  end
end
