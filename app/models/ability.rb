class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new

      if user.consumer?
        can [:read, :create, :update], User, id: user.id
        can [:update], Consumer, id: user.profile_id
      end
  end
end
