class User < ApplicationRecord
  has_secure_password

  belongs_to :profile, polymorphic: true, dependent: :destroy

  validates :email,
            uniqueness: { case_sensitive: false },
            presence: true,
            email: true

  validates :password,
            length: { minimum: 8 },
            confirmation: true

  validates :password_confirmation,
            presence: true

  def generate_token
    Knock::AuthToken.new(payload: { sub: id }).token
  end

end
