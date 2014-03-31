class CreatePatternsTickers < ActiveRecord::Migration
  def change
    create_table :patterns_tickers, index: true, id: false do |t|
    	t.references :pattern, :ticker
    end
  end
end
