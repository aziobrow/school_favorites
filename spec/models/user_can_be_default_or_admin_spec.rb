require 'rails_helper'

describe User do
  it "user is a default user" do
    user = User.create(name: "aziobrow", email: "aziobrow@gmail.com", password: "1234", role: 0)

    expect(user).to be_valid
    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end

  it "user is an admin user" do
    user = User.create(name: "aziobrow", email: "aziobrow@gmail.com", password: "1234", role: 1)

    expect(user).to be_valid
    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "user defaults to default user" do
    user = create(:user)

    expect(user).to be_valid
    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
