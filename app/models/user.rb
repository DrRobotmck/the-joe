class User < ActiveRecord::Base

	validates_presence_of :name
	validates_presence_of :email
	validates_uniqueness_of :email, error: "has already been used"

	has_secure_password
	has_and_belongs_to_many :shops

	def favorite(shop)
		unless self.shops.include?(shop)
			self.shops << shop
		end
	end

	def unfavorite(shop)
		self.shops.destroy(shop)
	end
end