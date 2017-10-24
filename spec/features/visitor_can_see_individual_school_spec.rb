require 'rails_helper'

describe "a visitor can see an individual school" do
  it "a visitor can see specific details for one school" do
    school = create(:school)
    visit school_path(school)

    expect(current_path).to eq("/schools/#{school.id}")
    expect(page).to have_content("#{school.name}")
    expect(page).to have_content("#{school.school_number}")
    expect(page).to have_content("#{school.address}")
    expect(page).to have_content("#{school.zip_code}")
    expect(page).to have_content("#{school.phone}")
    expect(page).to have_content("#{school.principal}")
    expect(page).to have_content("#{school.grade_levels}")
    expect(page).to have_content("#{school.web_url}")
    expect(page).to have_content("#{school.description}")
    expect(page).to have_content("#{school.district.name}")
  end
end
