class CreateRelevance < ActiveRecord::Migration
  def change
    create_table :relevance, index: true do |t|
    	t.references :pattern, :scan
    	t.integer :pattern_relevance
    end
  end
end
