class Shop < ActiveRecord::Base

	validates_presence_of :name, :address, :city, :neighborhood, :state, :zip, :phone, :snippet, :rating_url, :image, :cross
	has_and_belongs_to_many :users

end