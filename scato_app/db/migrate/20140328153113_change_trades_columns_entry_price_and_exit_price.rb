class ChangeTradesColumnsEntryPriceAndExitPrice < ActiveRecord::Migration
  def change
  	reversible do |dir|
  		dir.up do
		  	change_column :trades, :entry_price, :float
		  	change_column :trades, :exit_price, :float
		  end

		  dir.down do
		  	change_column :trades, :entry_price, :integer
		  	change_column :trades, :exit_price, :integer
		  end
		end
  end
end
