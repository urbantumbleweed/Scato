class DropTableInvestorScans < ActiveRecord::Migration
  def change
  	drop_table :investors_scans
  end
end
