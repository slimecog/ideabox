require "rails_helper"

describe "as an admin" do
  describe "when i visit admin category index" do
    it "i can see all categories" do
        admin = User.create!(username: "username", password: "password", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        category1 = Category.create!(title: "title1")
        category2 = Category.create!(title: "title2")
        category3 = Category.create!(title: "title3")

        visit admin_categories_path

        expect(page).to have_content(category1.title)
        expect(page).to have_content(category2.title)
        expect(page).to have_content(category3.title)
    end
  end
end
