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

  describe "roles" do
    it "can be created as an admin" do
      admin = User.create!(username: "user", password: "pass", role: 1)

      expect(admin.role).to eq("admin")
      expect(admin.admin?).to be_truthy
    end

    it "can be created as a regular user" do
      user = User.create!(username: "user", password: "pass", role: 0)

      expect(user.role).to eq("default")
      expect(user.admin?).to be_falsey
      expect(user.default?).to be_truthy
    end

    it "can be created without role default to default" do
      defaulted = User.create!(username: "user", password: "pass", role: 0)

      expect(defaulted.role).to eq("default")
      expect(defaulted.admin?).to be_falsey
      expect(defaulted.default?).to be_truthy
    end
  end
end
