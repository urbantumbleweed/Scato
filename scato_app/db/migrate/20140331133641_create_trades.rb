class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades, index: true do |t|
    	t.string :entry_order_type, :exit_order_type
    	t.date :entry_date, :exit_date
    	t.float :entry_price, :exit_price
    	t.integer :entry_quantity, :exit_quantity, :reference_ticker_id
    	t.references :user, :opportunity, :scan, :ticker
    	t.boolean :trade_open, :profitable
    	t.timestamps
    end
  end
end
