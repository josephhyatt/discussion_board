class Ability
  include CanCan::Ability
    # for each new user who has a role of admin
    # can manage all otherwise they can read all
    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.has_role? :admin
        can :manage, :all
      else
        can :read, :all
      end
  end
end
