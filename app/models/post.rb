class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  enum category: { cat_one: 0, cat_two: 1 }

  validates :user,
            presence: true
end
