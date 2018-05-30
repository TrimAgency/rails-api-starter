class User < ApplicationRecord
  has_secure_password

  belongs_to :profile, polymorphic: true, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :email,
            uniqueness: { case_sensitive: false },
            presence: true,
            email: true,
            if: -> { new_record? || !email.nil? }

  validates :password,
            length: { minimum: 8 },
            confirmation: true,
            if: -> { new_record? || !password.nil? }

  validates :password_confirmation,
            presence: true,
            if: -> { new_record? || (!password.nil?) }

  def generate_token
    Knock::AuthToken.new(payload: { sub: id }).token
  end

  def consumer?
    profile_type == 'Consumer'
  end
end
