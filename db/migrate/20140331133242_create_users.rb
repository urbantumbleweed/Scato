class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, index: true do |t|
    	t.string :name, :username, :email, :password_digest
    	t.float :balance, :max_position_percent, :max_risk_percent_per_position
    	t.boolean :admin, :manager
    	t.timestamps
    end
  end
end
