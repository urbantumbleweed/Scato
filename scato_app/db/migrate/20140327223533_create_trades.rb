class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades, index: true do |t|
    	t.string :primary_symbol, :reference_symbol, :entry_order_type, :exit_order_type
    	t.date :entry_date, :exit_date
    	t.boolean :trade_open
    	t.integer :entry_price, :entry_quantity, :exit_price, :exit_quantity
    	t.references :investor, :opportunity
    end
  end
end
