class Consumer < ApplicationRecord
  has_one :user, as: :profile

  validates :first_name, :last_name, presence: true

  def serializer
    ConsumerSerializer
  end
end
