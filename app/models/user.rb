class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_secure_password
	validates :name, :email, :password, presence: true
	validates :name, :password, length: { in: 6..20 }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :name, :email, uniqueness: { case_sensitive: false }
end
