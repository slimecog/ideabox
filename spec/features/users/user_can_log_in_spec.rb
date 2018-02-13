require "rails_helper"

describe "when a user logs in" do
  it "they see their personal info" do
    user = User.create!(username: "username", password: "test")

    visit "/"

    click_on "Have an account?"

    expect(current_path).to eq(login_path)

    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Log Out")

    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Successfully logged out.")
  end
end
