class CreateOpportunityUser < ActiveRecord::Migration
  def change
  	create_table :usertunities, index: true do |t|
  		t.references :user, :opportunity
  		t.integer :position_size
	  	t.float :risk_amount
	  	t.float :expected_opportunity_return
  	end
  end
end
