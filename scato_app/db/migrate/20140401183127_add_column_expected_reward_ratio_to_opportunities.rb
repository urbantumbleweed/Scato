class AddColumnExpectedRewardRatioToOpportunities < ActiveRecord::Migration
  def change
  	add_column :opportunities, :expected_reward_ratio, :float
  end
end
