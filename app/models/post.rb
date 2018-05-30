class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  enum category: { cat_one: 0, cat_two: 1 }

  validates :user,
            presence: true

  def set_tags(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip.downcase).first_or_create!
    end
  end

  def add_tag(name)
    self.tags << Tag.where(name: name.strip.downcase).first_or_create!
  end
end
