require "rails_helper"

describe "as an admin" do
  describe "when i visit admin category index" do
    describe "there are links to delete individual categories" do
      it "clicking the link deletes the category" do
        admin = User.create!(username: "username", password: "password", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit new_admin_category_path

        fill_in "category[title]", with: "title"
        click_on "Create Category"

        visit admin_categories_path

        click_on "Delete"

        expect(current_path).to eq(admin_categories_path)
        expect(page).to have_content("Category Deleted")
        expect(page).to_not have_content("title")
      end
    end
  end
end
