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

  it "user can delete a school from favorites list" do
    school = create(:school)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit school_path(school)
    click_link "Add Favorite"
    click_link "Unfavorite"

    expect(page).to have_content("#{school.name} removed from favorites")
  end
end
