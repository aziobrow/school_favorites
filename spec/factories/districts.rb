FactoryBot.define do
  factory :district do
    sequence(:name) {|n| "District #{n}" }
    sequence(:board_member) {|n| "Board Member #{n}"}
  end
end
