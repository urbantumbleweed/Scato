class RenameTypeToPatternTypeInPatterns < ActiveRecord::Migration
  def change
  	change_table :patterns do |t|
  		t.rename :type, :pattern_type
  	end
  end
end
