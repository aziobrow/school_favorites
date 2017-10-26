require 'rails_helper'

describe "a user can see a list of favorites" do
  it "a user can see all of their favorite schools" do
    user = create(:user)
    school = create(:school)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit school_path(school)
    click_link "Add Favorite"
    visit user_path(user)

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("#{school.name}")
  end
end
