require "rails_helper"

describe "as an admin" do
  describe "when i visit images path" do
    it "i can add an image" do
      admin = User.create!(username: "username", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path

      fill_in "image[url]", with: "https://images.unsplash.com/photo-1507090960745-b32f65d3113a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=92a1714119e42bc9d947f75ec4733ed6&auto=format&fit=crop&w=2850&q=80"
      click_on "Create Image"

      expect(current_path).to eq(admin_images_path)
      expect(page).to have_xpath("//img[contains(@src, 'https://images.unsplash.com/photo-1507090960745-b32f65d3113a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=92a1714119e42bc9d947f75ec4733ed6&auto=format&fit=crop&w=2850&q=80')]")
    end
  end
end
