require "rails_helper"

describe "as a logged in user" do
  describe "when i visit my ideas page" do
    describe "and click delete by an idea" do
      it "deletes the dang thing" do
        user = User.create!(username: "name", password: "test")
        idea1 = Idea.create!(title: "title 1", content: "content 1", user: user)
        idea2 = Idea.create!(title: "title 2", content: "content 2", user: user)
        visit '/'
        click_on "Have an account?"
        fill_in "username", with: user.username
        fill_in "password", with: user.password
        click_on "Log In"
        visit user_ideas_path(user)

        expect(page).to have_link("Delete")

        within(".idea_#{idea1.id}") do
          click_on "Delete"
        end

        expect(current_path).to eq(user_ideas_path(user))
        expect(page).to have_content(idea2.title)
        expect(page).to have_content(idea2.content)
        expect(page).to_not have_content(idea1.title)
        expect(page).to_not have_content(idea1.content)

      end
    end
  end
end
