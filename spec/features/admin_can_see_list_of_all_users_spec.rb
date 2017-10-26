require 'rails_helper'

describe "when a user visits the list of all users" do
  context "as an admin" do
    it "can see all users" do
      user = create(:user)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_users_path

      expect(page).to have_content("#{user.name}")
      expect(page).to have_content("#{admin.name}")
    end

    it "can see all default users with delete links" do
      user = create(:user)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_users_path

      expect(page).to have_content("Delete")
    end

    it "can see all admin users without delete links" do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_users_path

      expect(page).to_not have_content("Delete")
    end
  end

  context "as a default user" do
    it "sees a 404 page not found" do
      default_user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)
      visit admin_users_path

      expect(status_code).to eq(404)
    end
  end

end
