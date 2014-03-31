class CreateOpportunityUser < ActiveRecord::Migration
  def change
  	create_table :opportunities_users, id: false, index: true do |t|
  		t.references :user, :opportunity
  	end
  end
end
