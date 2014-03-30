class CreateInvestorsOpportunities < ActiveRecord::Migration
  def change
    create_table :investors_opportunities, index: true, id: false do |t|
    	t.integer :investor_id, :opportunity_id
    end
  end
end
