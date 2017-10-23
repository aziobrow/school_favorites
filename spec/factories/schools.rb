FactoryBot.define do
  factory :school do
    sequence(:school_number) {|n| n}
    sequence(:name) {|n| "School Name #{n}"}
    sequence(:address)  {|n| "#{n} Main Street"}
    sequence(:zip_code) {|n| "0000#{n}"}
    sequence(:phone) {|n| "555-555-555#{n}"}
    sequence(:principal) {|n| "Principal #{n}"}
    sequence(:grade_levels) {|n| "Grade Levels K-#{n}"}
    sequence(:web_url)  {|n| "Url: #{n}"}
    description ["Elementary", "Middle", "High"].sample
    district
  end
end
