require "rails_helper"

describe "as a logged in user" do
  describe "when i visit my ideas page" do
    describe "and click on edit by an idea" do
      it "i am able to edit an idea" do
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

        expect(page).to have_link("Edit")

        within(".idea_#{idea1.id}") do
          click_on "Edit"
        end

        expect(current_path).to eq(edit_idea_path(idea1))

        fill_in "idea[title]", with: "new title"
        fill_in "idea[content]", with: "new content"
        click_on "Update Idea"

        expect(current_path).to eq(idea_path(idea1))
        expect(page).to have_content("new title")
        expect(page).to have_content("new content")

        visit user_ideas_path(user)

        expect(page).to have_content("new title")
        expect(page).to have_content("new content")
        expect(page).to_not have_content(idea1.title)
        expect(page).to_not have_content(idea1.content)
        expect(page).to have_content(idea2.title)
        expect(page).to have_content(idea2.content)
      end
    end
  end
end
