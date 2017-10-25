require 'rails_helper'

describe "an admin can delete an existing school" do
  it "admin can delete a school" do
    school = create(:school)
    admin_user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    visit schools_path

    within(".school_info") do
      expect(page).to have_content("#{school.name}")
    end

    click_link "Delete"

    expect(page).to have_content("You have successfully deleted #{school.name}")
    within(".school_info") do
      expect(page).to_not have_content("#{school.name}")
    end

  end
end
