require 'rails_helper'

describe "an admin can delete an existing school" do
  it "admin can delete a school" do
    school1 = create(:school)
    school2 = create(:school)
    admin_user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    visit schools_path

    within(".all-schools") do
      expect(page).to have_content("#{school1.name}")
      first(:link, "Delete").click
    end

    expect(page).to have_content("You have successfully deleted #{school1.name}")

    within(".all-schools") do
      expect(page).to_not have_content("#{school1.name}")
    end

  end
end
