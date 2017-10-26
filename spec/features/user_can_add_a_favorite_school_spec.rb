require 'rails_helper'

describe "when a user favorites an existing school" do
  it "user can select a favorite school" do
    school = create(:school)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit school_path(school)

    click_link "Add Favorite"

    expect(page).to have_content("#{school.name} added to favorites")
  end
  #add something to check user path page for all favorited schools
end
