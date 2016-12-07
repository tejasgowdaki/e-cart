class Ability
  include CanCan::Ability

  def initialize(user)


    if user.nil?
        can :read, [Product, Category, SubCategory, Brand, Review]
    elsif user.role? "admin"
        can :manage, :all
    elsif user.role? "user"

        # Read
        can :read, [Product, Category, SubCategory, Brand, Review]
        can :read, Order 
        can :read, OrderLineItem do |order_line_item|
            order_line_item.try(:user) == user
        end
        can :read, CartLineItem do |cart_line_item|
            cart_line_item.try(:user) == user
        end
        can :read, UserProfile do |user_profile|
            user_profile.try(:user) == user
        end
        can :read, Address do |address|
            address.try(:user) == user
        end

        # Create
        can :create, Order 
        can :create, OrderLineItem 
        can :create, CartLineItem 
        can :create, Review 
        can :create, Address         
        can :create, UserProfile

         # Update
        can :update, CartLineItem do |cart_line_item|
            cart_line_item.try(:user) == user
        end
        can :update, Review do |review|
            review.try(:user) == user
        end
        can :update, Address do |address|
            address.try(:user) == user
        end
        can :update, UserProfile do |user_profile|
            user_profile.try(:user) == user
        end

        # Destroy
        can :destroy, CartLineItem do |cart_line_item|
            cart_line_item.try(:user) == user
        end
        can :destroy, Review do |review|
            review.try(:user) == user
        end
        can :destroy, Address do |address|
            address.try(:user) == user
        end
    end
            
            


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
