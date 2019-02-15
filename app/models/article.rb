class Article < ApplicationRecord
	has_many :comments , dependent: :destroy
	belongs_to :user
	after_initialize do |user|
		puts "You initialized an object"
	end

	after_find do |user|
		puts "You find an object"
	end


	after_touch do |user|
    	puts "You have touched an object"
  	end


	validates :title, 
	presence: true,
	length: {minimum: 5}
end
