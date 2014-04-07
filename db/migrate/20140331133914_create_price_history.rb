class CreatePriceHistory < ActiveRecord::Migration
  def change
    create_table :price_histories do |t|
    	t.references :ticker
    	t.date :date
    	t.float :open, :high, :low, :close
    	t.float :day_range, :open_close, :open_low, :open_high
    	t.float :close_low, :close_high
    	t.boolean :priceUp, :priceDown
    	t.integer :volume
    end
  end
end
