require 'rails_helper'

RSpec.describe School, type: :model do
  describe "Validations" do
    context "invalid attributes" do

      it "is invalid without a school number" do
        district = create(:district)
        school = School.new(name: "Southmoor Elementary", address: "3755 S Magnolia Way", principal: "Sarina Compoz", description: "Elementary", district: district)

        expect(school).to be_invalid
      end

      it "is invalid without a unique school number" do
        district = create(:district)
        school1 = School.new(school_number: 150, name: "Southmoor Elementary", address: "3755 S Magnolia Way", principal: "Sarina Compoz", description: "Elementary", district: district)
        school2 = School.new(school_number: 150, name: "Southmoor Elementary", address: "3755 S Magnolia Way", principal: "Sarina Compoz", description: "Elementary", district: district)

        expect(school2).to be_invalid
      end

      it "is invalid without a name" do
        district = create(:district)
        school = School.new(school_number: 150, address: "3755 S Magnolia Way", principal: "Sarina Compoz", description: "Elementary", district: district)

        expect(school1).to be_valid
        expect(school).to be_invalid
      end

      it "is invalid without a unique name" do
        district = create(:district)
        school1 = School.new(school_number: 150, name: "Southmoor Elementary", address: "3755 S Magnolia Way", principal: "Sarina Compoz", description: "Elementary", district: district)
        school2 = School.new(school_number: 151, name: "Southmoor Elementary", address: "3755 S Magnolia Way", principal: "Sarina Compoz", description: "Elementary", district: district)

        expect(school1).to be_valid
        expect(school2).to be_invalid
      end

      it "is invalid without an address" do
        district = create(:district)
        school = School.new(school_number: 150, name: "Southmoor Elementary", principal: "Sarina Compoz", description: "Elementary", district: district)

        expect(school).to be_invalid
      end

      it "is invalid without a principal" do
        district = create(:district)
        school = School.new(school_number: 150, name: "Southmoor Elementary", address: "3755 S Magnolia Way", description: "Elementary", district: district)

        expect(school).to be_invalid
      end

      it "is invalid without a description" do
        district = create(:district)
        school = School.new(school_number: 150, name: "Southmoor Elementary", address: "3755 S Magnolia Way", principal: "Sarina Compoz", district: district)
      end
    end

    context "valid attributes" do
      it "is valid with a school number, name, address, principal, and description" do
        district = create(:district)
        school = School.new(school_number: 150, name: "Southmoor Elementary", address: "3755 S Magnolia Way", principal: "Sarina Compoz", description: "Elementary", district: district)

        expect(school).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a district" do
      district = create(:district)
      school = School.new(school_number: 150, name: "Southmoor Elementary", address: "3755 S Magnolia Way", principal: "Sarina Compoz", description: "Elementary", district: district)

      expect(school).to respond_to(:district)
    end
  end
end
