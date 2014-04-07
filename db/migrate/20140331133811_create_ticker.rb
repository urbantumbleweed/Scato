class CreateTicker < ActiveRecord::Migration
  def change
    create_table :tickers, index: true do |t|
    	t.string :ticker, :name, :type, :exchange, :sector, :industry
    	t.date :date
    	t.float :ask, :bid, :previousClose
    	t.float :open, :dayHigh, :dayLow, :lastTrade
    	t.float :changePoints, :changePercent, :weeks52High, :weeks52Low 
    	t.float :peRatio, :pegRatio
    	t.float :weeks52ChangeFromHigh, :weeks52ChangePercentFromHigh
    	t.float :weeks52ChangeFromLow, :weeks52ChangePercentFromLow
    	t.integer :volume
    end
  end
end
