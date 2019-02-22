class UserRegistrationForm
  include ActiveModel::Model

  attr_accessor :email,
                :password,
                :password_confirmation,
                :profile,
                :profile_type,
                :user

  validates :email,
            presence: true,
            email: true

  validates :password,
            length: { minimum: 8 },
            confirmation: true

  validates :password_confirmation,
            presence: true

  validates :profile,
            presence: true

  validates :profile_type,
            presence: true,
            inclusion: { in: ['consumer'] }

  validate :profile_has_all_fields

  def save!
    raise ActiveRecord::RecordInvalid.new self unless valid?

    ActiveRecord::Base.transaction do
      create_profile!
      create_user!
    end
  end

  private

  def create_profile!
    case profile_type.downcase
    when 'consumer'
      create_consumer_profile!
    end

  end

  def create_consumer_profile!
    @profile_model = Consumer.create!(first_name: profile[:first_name],
                                      last_name: profile[:last_name])
  end

  def create_user!
    @user = User.create!(email: email.downcase,
                         password: password,
                         password_confirmation: password_confirmation,
                         profile: @profile_model)
  end

  def profile_has_all_fields
    if profile[:first_name].blank?
      errors.add(:first_name, "can't be blank")
    end

    if profile[:last_name].blank?
      errors.add(:last_name, "can't be blank")
    end
  end
end