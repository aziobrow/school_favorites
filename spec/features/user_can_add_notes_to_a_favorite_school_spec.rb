require 'rails_helper'

describe "when a user visits a show page for a favorite school" do
  it "the user sees a form to add a note" do
    school = create(:school)
    user = create(:user)
    favorite = create(:favorite_school, school: school, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit school_path(school)

    expect(page).to have_content("Add a Note")
  end

  it "the user can add a note to a favorite school" do
    school = create(:school)
    user = create(:user)
    favorite = create(:favorite_school, school: school, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit school_path(school)
    fill_in "note[content]", with: "This school is cool."
    click_button "Add Note"

    expect(current_path).to eq(school_path(school))
    expect(page).to have_content("This school is cool")
    expect(page).to have_content("Notes (1)")
  end
end
