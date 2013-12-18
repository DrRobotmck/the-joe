class CreateShopsUsers < ActiveRecord::Migration
  def change
    create_table :shops_users do |t|
    	t.belongs_to :shop
    	t.belongs_to :user
    	t.timestamps
    end
  end
end
