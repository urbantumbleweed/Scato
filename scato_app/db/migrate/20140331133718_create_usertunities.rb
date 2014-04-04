class CreateUsertunities < ActiveRecord::Migration
  def change
  	create_table :usertunities, index: true do |t|
  		t.references :user, :opportunity
  		t.integer :position_size
	  	t.float :risk_amount
	  	t.float :actual_usertunity_return
	  	t.float :actual_usertunity_risk_reward_ratio
	  	t.float :expected_usertunity_return
	  	t.boolean :converted_to_trade
  	end
  end
end
