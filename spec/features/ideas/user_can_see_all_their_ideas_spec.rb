require "rails_helper"

describe "as a logged in user" do
  describe "when they visit their ideas page" do
    it "they can see all their ideas" do
        user = User.create!(username: "name", password: "test")
        category = Category.create!(title: "cat1")
        idea1 = Idea.create!(title: "title 1", content: "content 1", user: user, category: category)
        idea2 = Idea.create!(title: "title 2", content: "content 2", user: user, category: category)

        visit '/'
        click_on "Have an account?"
        fill_in "username", with: user.username
        fill_in "password", with: user.password
        click_on "Log In"

        visit user_ideas_path(user)

        expect(page).to have_content(idea1.title)
        expect(page).to have_content(idea2.title)
    end
  end
end
