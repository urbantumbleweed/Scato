class RenameTablePatternScansToPatternRelevanceScan < ActiveRecord::Migration
  def change
  	rename_table :patterns_scans, :pattern_relevance_scans
  end
end
