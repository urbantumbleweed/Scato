class AddMaxRiskPercentPerPositionToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :max_risk_percent_per_position, :integer
  end
end
