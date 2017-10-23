require 'rails_helper'

describe "a visitor can create a new account" do
  it "a visitor signs up to become a new user" do
    visit "/"
    click_on "Sign Up"

    expect(current_path).to eq(login_path)

    fill_in "user[name]", with: "aziobrow"
    fill_in "user[password]", with: "1234"
    click_on "Create Account"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome, #{User.last.name}!")
    expect(page).to have_link("Logout")
  end
end
