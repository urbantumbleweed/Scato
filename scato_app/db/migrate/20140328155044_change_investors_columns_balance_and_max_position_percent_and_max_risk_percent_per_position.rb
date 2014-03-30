class ChangeInvestorsColumnsBalanceAndMaxPositionPercentAndMaxRiskPercentPerPosition < ActiveRecord::Migration
  def change
  	reversible do |dir|
  		dir.up do
		  	change_column :investors, :balance, :float
		  	change_column :investors, :max_position_percent, :float
		  	change_column :investors, :max_risk_percent_per_position, :float
		  end

		  dir.down do
		  	change_column :investors, :balance, :integer
		  	change_column :investors, :max_position_percent, :float
		  	change_column :investors, :max_risk_percent_per_position, :integer
		  end
		end
  end
end
