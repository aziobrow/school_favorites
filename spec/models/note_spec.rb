require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "relationships" do
    it "belongs to a favorite school" do
      note = create(:note)
      expect(note).to respond_to(:favorite_school)
    end
  end
end
