class CreateOpportunity < ActiveRecord::Migration
  def change
    create_table :opportunities, index: true do |t|
    	t.float :strength, :risk, :expected_reward, :expected_reward_ratio
    	t.float :aggregate_actual_opportunity_risk_reward_ratio
    	t.float :aggregate_actual_opportunity_return
    	t.string :opportunity_type
    	t.integer :priority
    	t.references :ticker, :scan
    end
  end
end
