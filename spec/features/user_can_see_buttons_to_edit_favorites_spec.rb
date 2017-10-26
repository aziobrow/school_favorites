require 'rails_helper'

describe "a user can see favorite buttons" do
  context "a user can edit favorites" do
    it "a user can see the favorite button" do
      user = create(:user)
      school = create(:school)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit school_path(school)

      expect(page).to have_content("Add Favorite")
    end

    it "a user can see the unfavorite button" do
      user = create(:user)
      school = create(:school)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit school_path(school)
      click_link "Add Favorite"

      expect(page).to have_content("Unfavorite")
    end
  end

  context "a visitor can't see favorites buttons" do
    it "a visitor doesn't see favorite button" do
      school = create(:school)
      visit school_path(school)

      expect(page).to_not have_content("Add Favorite")
    end
  end
end
