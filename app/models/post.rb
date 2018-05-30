class Post < ApplicationRecord
  belongs_to :user

  enum category: { cat_one: 0, cat_two: 1 }

  validates :user,
            presence: true
end
