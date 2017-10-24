require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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

schools = (CSV.open'db/csv/school.csv', headers: true, header_converters: :symbol)

count = 0
schools.each do |school|
  puts "School #{count} created"
  count += 1

  created = School.create!(school_number: school[:schoolnumber].to_i,
                name: school[:name],
                address: school[:address],
                zip_code: school[:zipcode9],
                phone: school[:phone],
                principal: school[:principalname],
                grade_levels: school[:gradelevels],
                web_url: school[:web_url],
                description: school[:schooltypedescription],
                district: District.first)
end
