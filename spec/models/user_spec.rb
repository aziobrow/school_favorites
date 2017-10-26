require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    context "invalid attributes" do

      it "is invalid without a name" do
        user = User.new(email: "aziobrow@gmail.com", password: "1234")

        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(name: "aziobrow", password: "1234")

        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(name: "aziobrow", email: "aziobrow@gmail.com")

        expect(user).to be_invalid
      end
    end

    context "valid attributes" do

      it "is valid with name, email, and password" do
        user = User.new(name: "aziobrow", email: "aziobrow@gmail.com", password: "1234")

        expect(user).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many favorite schools" do
      user = create(:user)
      expect(user).to respond_to(:favorite_schools)
    end

    it "has many schools" do
      user = create(:user)
      expect(user).to respond_to(:schools)
    end
  end
end
