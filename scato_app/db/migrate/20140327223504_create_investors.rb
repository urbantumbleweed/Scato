class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors, index: true do |t|
    	t.string :name, :email, :account_number, :password_digest
    	t.integer :balance, :max_position_percent
    end
  end
end
