require 'rails_helper'

describe "a visitor can create a new account" do
  it "a visitor signs up to become a new user" do
    visit "/"
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in "user[name]", with: "aziobrow"
    fill_in "user[email]", with: "aziobrow@gmail.com"
    fill_in "user[password]", with: "1234"
    click_on "Create Account"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome, #{User.last.name}!")
  end

  it "a user can log in" do
    user = create(:user)
    visit "/"
    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in "session[name]", with: "#{user.name}"
    fill_in "session[password]", with: "#{user.password}"
    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.name}!")
  end

  it "a user can log out of account" do
    user = create(:user)
    visit login_path
    fill_in "session[name]", with: "User 1"
    fill_in "session[password]", with: "xyz1"
    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_link("Logout")

    click_on "Logout"

    expect(current_path).to eq(root_path)
  end
end
