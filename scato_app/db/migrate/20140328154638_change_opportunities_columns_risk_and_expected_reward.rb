class ChangeOpportunitiesColumnsRiskAndExpectedReward < ActiveRecord::Migration
  def change
  	reversible do |dir|
  		dir.up do
		  	change_column :opportunities, :risk, :float
		  	change_column :opportunities, :expected_reward, :float
		  end

		  dir.down do
		  	change_column :opportunities, :risk, :integer
		  	change_column :opportunities, :expected_reward, :integer
		  end
		end
  end
end
