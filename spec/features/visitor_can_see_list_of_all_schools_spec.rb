require 'rails_helper'

describe "a visitor can see a list of all schools" do
  it "a visitor can see a list of all DPS schools" do
    school1 = create(:school)
    school2 = create(:school)
    visit schools_path

    expect(current_path).to eq("/schools")
    expect(page).to have_content("#{school1.name}")
    expect(page).to have_content("#{school2.name}")
  end
end
