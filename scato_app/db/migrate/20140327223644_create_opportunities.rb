class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities, index: true do |t|
    	t.integer :strength, :risk, :expected_reward, :priority
    	t.references :scan
    end
  end
end
