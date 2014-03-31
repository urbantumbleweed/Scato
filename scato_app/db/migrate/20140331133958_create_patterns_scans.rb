class CreatePatternsScans < ActiveRecord::Migration
  def change
    create_table :patterns_scans, index: true do |t|
    	t.references :pattern, :scan
    	t.integer :pattern_relevance
    end
  end
end
