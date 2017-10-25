require 'rails_helper'

describe "an admin can edit an existing school" do
  it "an admin can update an individual school details" do
    admin_user = create(:user, role: 1)
    district = create(:district)
    school = create(:school)
    original_school_name = school.name
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    visit edit_admin_school_path(school)

    expect(page).to have_content("#{original_school_name}")

    fill_in "school[name]", with: "New School Name"
    click_button "Update School"

    expect(current_path).to eq(school_path(school))
    expect(page).to have_content("New School Name")
    expect(page).to_not have_content("#{original_school_name}")
  end
end
