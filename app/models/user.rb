class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  # Manually disabled until needed:
  #:registerable, :recoverable,
  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  validates_presence_of :name

  has_and_belongs_to_many :roles

end
