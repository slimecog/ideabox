require "rails_helper"

describe "when a user visits root" do
  it "they can sign up for an account" do
    visit "/"

    click_on "sign up"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "name"
    fill_in "user[email]", with: "email@email.com"
    fill_in "user[password]", with: "test"

    click_on "Create User"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("welcome, name")
  end
end
