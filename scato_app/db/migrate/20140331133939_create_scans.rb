class CreateScans < ActiveRecord::Migration
  def change
    create_table :scans, index: true do |t|
    	t.references :ticker
    	t.boolean :entry_signal, :exit_signal
    	t.boolean :entry_confirmation, :entry_confirmation_two
    	t.boolean :exit_confirmation, :exit_confirmation_two
    	t.timestamps
    end
  end
end
