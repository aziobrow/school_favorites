require 'rails_helper'

describe "when I visit a form to create a new school" do
  describe "as an admin" do
    it "admin sees a form to create a new school" do
      admin_user = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
      visit new_admin_school_path

      expect(current_path).to eq("/admin/schools/new")
      expect(page).to have_content("Create New DPS School")
    end
  end

  describe "as a default user" do
    it "default user sees a 404 page not found" do
      default_user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)
      visit new_admin_school_path

      expect(status_code).to eq(404)
    end
  end
end
