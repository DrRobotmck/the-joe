class User < ActiveRecord::Base

	validates_presence_of :name
	validates_presence_of :email
	validates_uniqueness_of :email, error: "has already been used"

	has_secure_password
end