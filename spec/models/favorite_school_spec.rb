require 'rails_helper'

RSpec.describe FavoriteSchool, type: :model do
  describe "relationships" do
    it "belongs to a user" do
      favorite_school = create(:favorite_school)
      expect(favorite_school).to respond_to(:user)
    end

    it "belongs to a school" do
      favorite_school = create(:favorite_school)
      expect(favorite_school).to respond_to(:school)
    end
    
  end
end
