require "rails_helper"

describe User do
  describe "validations" do
    describe "invalide attributes" do
      it "is invalid without a username" do
        user = User.new(password: "test")

        expect(user).to_not be_valid
      end

      it "is invalid without a password" do
        user = User.new(username: "username")

        expect(user).to_not be_valid
      end
    end

    describe "valid attributes" do
      it "is valid with username and password" do
        user = User.new(username: "username", password: "test")

        expect(user).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many ideas" do
      user = User.new(username: "username", password: "test")

      expect(user).to respond_to(:ideas)
    end
  end
end
