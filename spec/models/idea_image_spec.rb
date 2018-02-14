require "rails_helper"

describe IdeaImage do
  describe "relationships" do
    it { should belong_to :idea }
    it { should belong_to :image }
  end
end
