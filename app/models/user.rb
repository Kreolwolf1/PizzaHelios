class User < ActiveRecord::Base
  before_create :create_role
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :telephone, :name, :surname, :password, :password_confirmation, :remember_me

  has_many :users_roles
  has_many :roles, :through => :users_roles

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  private
    def create_role
      self.roles << Role.find_by_name(:user)  
    end
end
