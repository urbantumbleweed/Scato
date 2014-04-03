class AddColumnPatternIdToOpportunities < ActiveRecord::Migration
  def change
  	add_column :opportunities, :pattern_id, :integer
  end
end
