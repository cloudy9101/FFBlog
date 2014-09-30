class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, :text, :user_id, presence: true
	validates :title, uniqueness: true
	searchkick
end
