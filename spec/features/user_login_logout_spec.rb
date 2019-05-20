require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq(new_user_path)

    fill_in "Username", with: "funbucket13"
    fill_in "Password", with: "test"

    click_on "Create User"

    new_user = User.last

    expect(page).to have_content("Welcome, #{new_user.username}!")
  end

  it "existing user can log in" do
    user = User.create(username: "funbucket13", password: "test")

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_link("Log out")
  end
end
