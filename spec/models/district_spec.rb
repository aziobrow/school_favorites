require 'rails_helper'

RSpec.describe District, type: :model do
  describe "Validations" do
    context "invalid attributes" do

      it "is invalid without a name" do
        district = District.new(board_member: "Anne Rowe")

        expect(district).to be_invalid
      end

      it "is invalid without a board member" do
        district = District.new(name: "District 5")

        expect(district).to be_invalid
      end
    end

    context "valid attributes" do

      it "is valid with a name and a board member" do
        district = District.new(name: "District 5", board_member: "Anne Rowe")

        expect(district).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many schools" do
      district = District.new(name: "District 1", board_member: "Anne Rowe")

      expect(district).to respond_to(:schools)
    end
  end
end
