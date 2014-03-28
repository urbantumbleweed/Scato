class CreateInvestorsScans < ActiveRecord::Migration
  def change
    create_table :investors_scans, index: true, id: false do |t|
    	t.references :investor, :scan
    end
  end
end
