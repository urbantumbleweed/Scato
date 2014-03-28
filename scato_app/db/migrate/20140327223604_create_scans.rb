class CreateScans < ActiveRecord::Migration
  def change
    create_table :scans do |t|
    	t.string :symbol, :security_type
    	t.timestamps
    end
  end
end
