class CreatePatternsSymbols < ActiveRecord::Migration
  def change
    create_table :patterns_symbols do |t|
    	t.integer :pattern_id, :symbol_id
    end
  end
end
