class UserSerializer < ApplicationSerializer
  identifier :id

  view :show do
    fields :email, :profile_type
    association :profile, blueprint: ->(profile) { profile.serializer }
  end

  view :create do
    include_view :show
    field :token do |user, options| 
      options[:token]
    end
  end

  # NOTE: It is the same as the show action for now, but here is a separate view for later use
  view :update do
    include_view :show
    exclude :token
  end
end
