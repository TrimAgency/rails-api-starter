class Consumer < ApplicationRecord
  has_one :user, as: :profile

  validates :first_name,
            presence: true

  validates :last_name,
            presence: true

  def serializer
    ConsumerSerializer
  end
end
