class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :profile

  def profile
    profile_serializer.new(object.profile)
  end

  def profile_serializer
    ("#{object.profile_type}Serializer").constantize
  end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end