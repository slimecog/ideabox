class User < ApplicationRecord
  has_secure_password
  validates_presence_of   :username,
                          :email,
                          :password
  validates_uniqueness_of :email
  has_many :ideas
end
