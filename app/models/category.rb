class Category < ApplicationRecord
  validates_presence_of :title
  has_many :ideas
end
