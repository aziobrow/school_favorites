FactoryBot.define do
  factory :user do
    sequence(:name )  {|n| "User #{n}"}
    sequence(:email) {|n| "user#{n}@gmail.com"}
    sequence(:password) {|n| "xyz#{n}"}
  end
end
