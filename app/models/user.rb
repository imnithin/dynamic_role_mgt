class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :role_id, :email, :password, :password_confirmation, :remember_me

  validates :role_id, :name, presence: true

  belongs_to :task
  belongs_to :role
  has_many :vacations

  # returns true/false
  def admin?
     self.role.name == 'admin' if self.role
  end
end

