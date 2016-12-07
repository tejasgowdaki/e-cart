class User < ActiveRecord::Base

	has_one :user_profile
	has_many :permissions
	has_many :roles, through: :permissions
  has_many :addresses
  has_many :reviews
  has_many :cart_line_items
  has_many :orders
  has_many :order_line_items

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :generate_role


  def generate_role
    Permission.create(user_id: self.id, role_id: Role.last.id)
  end

  def role?(role)
    self.roles.pluck(:name).include? role
   end
         
end
