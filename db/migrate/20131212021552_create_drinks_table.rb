class CreateDrinksTable < ActiveRecord::Migration
  def change
    create_table :drinks do |d|
    	d.string :name, null:false
    	d.text :definition, null: false
    	d.string :image_url

    	d.timestamps
    end
    add_timestamps :shops
  end
end
