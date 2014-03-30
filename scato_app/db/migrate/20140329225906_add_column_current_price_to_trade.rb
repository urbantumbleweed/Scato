class AddColumnCurrentPriceToTrade < ActiveRecord::Migration
  def change
  	add_column :trades, :current_price, :float
  end
end
