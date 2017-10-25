require 'rails_helper'

describe "an admin can create a new school" do
  it "admin can fill out form" do
    admin_user = create(:user, role: 1)
    district = create(:district)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    visit new_admin_school_path

    fill_in "school[school_number]", with: 100
    fill_in "school[name]", with: "Southmoor Elementary"
    fill_in "school[address]", with: "123 Main St"
    fill_in "school[zip_code]", with: "12345"
    fill_in "school[phone]", with: "123-456-7890"
    fill_in "school[principal]", with: "Sarina Compoz"
    fill_in "school[grade_levels]", with: "K-5"
    fill_in "school[web_url]", with: "wwww.southmoor.com"
    fill_in "school[description]", with: "Elementary"
    select("#{district.name}", from: "school_district_id")

    click_button "Create School"

    expect(current_path).to eq(school_path(School.last))
    expect(page).to have_content(100)
    expect(page).to have_content("Southmoor Elementary")
    expect(page).to have_content("123 Main St")
    expect(page).to have_content("12345")
    expect(page).to have_content("123-456-7890")
    expect(page).to have_content("Sarina Compoz")
    expect(page).to have_content("K-5")
    expect(page).to have_content("wwww.southmoor.com")
    expect(page).to have_content("Elementary")
    expect(page).to have_content("#{district.name}")
  end
end
