class CreatePatternsScans < ActiveRecord::Migration
  def change
    create_table :patterns_scans do |t|
    	t.integer :pattern_id, :pattern_relevance, :scan_id
    end
  end
end
