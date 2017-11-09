class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_profile?
      can :manage, UserProfile, user_id: user.id
      can :manage, Property, user_id: user.id
      can [:properties, :add_contact], UserProfile
      can :contacts, UserProfile, user_id: user.contacts
      can :manage, Message, user_id: user.id
      can :read, Message, recipient_id: user.id
      can :read, :all
    elsif user.persisted?
      can [:new, :create], UserProfile
    else
      can [:read, :properties], UserProfile, role: 'Comisionista'
      can :show, UserProfile, role: 'Propietario'
      can :read, Property
    end

    if user.agent?
    elsif user.owner?
    elsif user.investment?
      cannot [:create, :new], Property
    end

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
