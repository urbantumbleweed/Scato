class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
    	t.string :name, :type
    	t.text :description
    	t.float :historical_target_reaching_strength
    	t.float :historical_directional_reliability
    	t.integer :historical_rarity_ranking
    end
  end
end
