class User < ActiveRecord::Base
  before_create :create_role
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :telephone, :name, :surname, :password, :password_confirmation, :remember_me

  validates :telephone, :presence => true,
                        :numericality => true
  validates :name, :presence => true
  validates :surname, :presence => true



  has_many :users_roles
  has_many :roles, :through => :users_roles

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  def long_name
    "#{name} #{surname}"
  end


  private
    def create_role
      if User.count > 0
        self.roles << Role.find_by_name(:user)  
      else 
        self.roles << Role.find_by_name(:admin)  
      end
    end
end
