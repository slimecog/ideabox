require "rails_helper"

describe "as a logged in user" do
  describe "when they visit their ideas page" do
    it "they can click a link to create a new idea" do
      user = User.create!(username: "name", password: "test")

      visit '/'
      click_on "Have an account?"
      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_on "Log In"

      visit user_ideas_path(user)

      expect(page).to have_link("Create a new Idea")

      click_on "Create a new Idea"

      expect(current_path).to eq(new_user_idea_path(user))

      fill_in "idea[title]", with: "title 1"
      fill_in "idea[content]", with: "content 1"
      click_on "Create Idea"

      expect(current_path).to eq(idea_path(user.ideas.last))
      expect(page).to have_content(user.ideas.last.title)
      expect(page).to have_content(user.ideas.last.content)
    end
  end
end
