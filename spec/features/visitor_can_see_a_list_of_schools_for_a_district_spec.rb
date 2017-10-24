require 'rails_helper'

describe "a visitor can see a list of schools for one district" do
  it "a visitor can see all schools belonging to a district" do
    school = create(:school)
    visit district_path(school.district)

    expect(current_path).to eq("/districts/#{school.district.id}")
    expect(page).to have_content("#{school.name}")
  end
end
