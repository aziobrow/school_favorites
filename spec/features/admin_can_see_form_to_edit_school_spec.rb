require 'rails_helper'

describe "when a user visits a form to edit an existing school" do
  describe "as an admin" do
    it "admin sees a form to edit an existing school" do
      school = create(:school)
      admin_user = create(:user, role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
      visit edit_admin_school_path(school)

      expect(current_path).to eq("/admin/schools/#{school.id}/edit")
      expect(page).to have_content("Edit #{school.name}")
    end
  end

  describe "as a default user" do
    it "default user sees a 404 page not found" do
      school = create(:school)
      default_user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)
      visit edit_admin_school_path(school)

      expect(status_code).to eq(404)
    end
  end
end
