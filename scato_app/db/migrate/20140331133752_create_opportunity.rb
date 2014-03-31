class CreateOpportunity < ActiveRecord::Migration
  def change
    create_table :opportunities, index: true do |t|
    	t.float :strength, :risk, :expected_reward
    	t.integer :priority
    	t.references :ticker, :scan
    end
  end
end
