require 'rails_helper'

describe "an admin can delete a user" do
  it "an admin can delete a user" do
    user = create(:user)
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_users_path
    click_link "Delete"

    expect(page).to have_content("User #{user.name} successfully deleted")
    within(".user_list") do
      expect(page).to_not have_content("#{user.name}")
    end

  end
end
