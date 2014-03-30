class ChangeTableScans < ActiveRecord::Migration
  def change
  	change_table :scans, index: true do 
	  	remove_column :scans, :symbol
	  	remove_column :scans, :security_type
			add_column :scans, :symbol_id, :integer
	  	add_column :scans, :entry_signal, :boolean 
	  	add_column :scans, :entry_confirmation, :boolean
	  	add_column :scans, :entry_confirmation_two, :boolean
	  	add_column :scans, :exit_signal, :boolean
	  	add_column :scans, :exit_confirmation, :boolean
	  	add_column :scans, :exit_confirmation_two, :boolean
	  end
  end
end