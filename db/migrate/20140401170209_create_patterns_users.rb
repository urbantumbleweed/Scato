class CreatePatternsUsers < ActiveRecord::Migration
  def change
    create_table :patterns_users, id: false, index: true do |t|
    	t.references :pattern, :user
    end
  end
end
