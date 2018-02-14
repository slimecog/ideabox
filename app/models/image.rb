class Image < ApplicationRecord
  validates_presence_of :url
  has_many :idea_images
  has_many :idea, through: :idea_images
end
