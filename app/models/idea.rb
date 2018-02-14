class Idea < ApplicationRecord
  validates_presence_of :title,
                        :content
  belongs_to :user
  belongs_to :category
end
