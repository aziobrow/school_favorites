require 'rails_helper'

describe "a visitor can see a list of all districts" do
  it "a visitor can see a list of all DPS districts" do
    visit "/districts"

    expect(current_path).to eq(districts_path)
    expect(page).to have_content("District 1")
    expect(page).to have_content("District 2")
    expect(page).to have_content("District 3")
    expect(page).to have_content("District 4")
    expect(page).to have_content("District 5")
    expect(page).to have_content("Anne Rowe")
    expect(page).to have_content("Rosemary Rodriguez")
    expect(page).to have_content("Mike Johnson")
    expect(page).to have_content("Rachele Espiritu")
    expect(page).to have_content("Lisa Flores")
  end
end
