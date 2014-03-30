class CreateTableSymbols < ActiveRecord::Migration
  def change
    create_table :table_symbols do |t|
    	t.string :symbol, :name, :exchange
    	t.date :date
    	t.float :ask, :bid, :volume, :previousClose, :open
    	t.float :dayHigh, :dayLow, :lastTrade, :changePoints
    	t.float :changePercent, :peRatio, :pegRatio
    	t.float :weeks52High, :weeks52Low
    	t.float :weeks52ChangeFromHigh, :weeks52ChangePercentFromHigh
    	t.float :weeks52ChangeFromLow, :weeks52ChangePercentFromLow
    	t.integer :avgDailyVolume
    end
  end
end
