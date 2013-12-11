class AddTables < ActiveRecord::Migration
  def change
  	create_table :shops do |s|
  		s.string :name, null: false
  		s.string :address, null: false
      s.string :cross, null: false
  		s.string :city, null: false
  		s.string :neighborhood, null: false
  		s.string :state, null: false
  		s.integer :zip, null: false
  		s.string :phone, null: false
  		s.decimal :rating, precision: 2, scale:1
  		s.text :snippet, null: false
  		s.string :rating_url, null: false
  		s.string :image, null: false
  	end
  end
end
