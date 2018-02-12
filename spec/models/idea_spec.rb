require "rails_helper"

describe Idea, type: :model do
  describe "validations" do
    describe "invalid attributes" do
      it "is invalid without content" do
        user = User.create!(name: "name", email: "email@email.com", password: "password")
        idea = Idea.new(user_id: user.id)

        expect(idea).to_not be_valid
      end

      it "is invalid without a user_id" do
        idea = Idea.new(content: "content")

        expect(idea).to_not be_valid
      end
    end

    describe "valid attributes" do
      it "is valid with name and user_id" do
        user = User.create!(name: "name", email: "email@email.com", password: "password")
        idea = Idea.new(content: "content", user_id: user.id)

        expect(idea).to be_valid
      end
    end

    describe "relationships" do
      it "belongs to a user" do
        user = User.create!(name: "name", email: "email@email.com", password: "password")
        idea = Idea.new(content: "content", user_id: user.id)

        expect(idea).to respond_to(:user)
      end
    end
  end
end
