require "rails_helper"

describe "as an admin" do
  describe "when i visit the admin category index" do
    it "i can click a link to view one category" do
      admin = User.create!(username: "username", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path

      fill_in "category[title]", with: "title"
      click_on "Create Category"

      visit admin_categories_path

      click_on "title"

      expect(current_path).to eq(admin_category_path(Category.last))
      expect(page).to have_content(Category.last.title)

    end
  end
end
