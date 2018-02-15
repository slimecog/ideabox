require "rails_helper"

describe "as an admin" do
  before :each do
    @image1 = Image.create!(url: 'https://images.unsplash.com/photo-1507090960745-b32f65d3113a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=92a1714119e42bc9d947f75ec4733ed6&auto=format&fit=crop&w=2850&q=80')
    @image2 = Image.create!(url: 'https://images.unsplash.com/photo-1440658172029-9d9e5cdc127c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=dadb738eb9a6442037648059532bb70a&auto=format&fit=crop&w=2026&q=80')
  end

  describe "when i visit images index" do
    it "i can see al images" do
      admin = User.create!(username: "username", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      expect(page).to have_content("All Images")
      expect(page).to have_link("Add a new Image")
      expect(page).to have_xpath("//img[contains(@src,'#{@image1.url}')]")
      expect(page).to have_xpath("//img[contains(@src,'#{@image2.url}')]")
    end
  end
end
