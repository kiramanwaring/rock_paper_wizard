class User < ActiveRecord::Base
	  has_secure_password
	  validates_confirmation_of :password
	  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	  validates_presence_of :password, on: :create
	  has_many :wizards
end
