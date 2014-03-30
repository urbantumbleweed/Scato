class CreatePriceHistory < ActiveRecord::Migration
  def change
    create_table :price_histories do |t|
    	t.date :date
    	t.float :open, :high, :low, :close
    	t.integer :volume
    end
  end
end
