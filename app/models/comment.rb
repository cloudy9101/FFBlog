class Comment < ActiveRecord::Base
	belongs_to :post
	validates :content,:name, :email, :post_id, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
