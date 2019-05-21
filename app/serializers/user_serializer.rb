class UserSerializer < ApplicationSerializer
  identifier :id

  fields :email, :profile_type
  association :profile, blueprint: ->(profile) { profile.serializer }
end
