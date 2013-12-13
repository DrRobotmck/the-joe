class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
    	u.string :name, null: false
    	u.string :email, null: false
    	u.string :password_digest, null: false

    	u.timestamps
    end
  end
end
