class ChangeInvestorRenameAccountNumberToUsername < ActiveRecord::Migration
  def change
  	rename_column :investors, :account_number, :username
  end
end
