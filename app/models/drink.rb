class Drink < ActiveRecord::Base
	validates_presence_of :name, :definition

end