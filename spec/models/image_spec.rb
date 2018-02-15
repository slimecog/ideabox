require "rails_helper"

describe Image do
  describe "validations" do
    it { should validate_presence_of :url }
  end

  describe "relationships" do
    it { should have_many(:ideas).through(:idea_images) }
  end
end
