class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :manager, :user]
  after_initialize :set_default_role, :if => :new_record?

  validates :role, presence: true,
  	inclusion: {  in: roles.keys,
  				  message: "%{value} is not a valid role" }

  def set_default_role
  	self.role ||= :user
  end
end
