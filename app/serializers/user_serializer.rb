class UserSerializer < ApplicationSerializer
  identifier :id

  view :create do
    fields :email, :profile_type
    association :profile, blueprint: ->(profile) { profile.serializer }
    field :token do |user, options| 
      options[:token]
    end
  end

  view :update do
    include_view :create
    exclude :token
  end
end
