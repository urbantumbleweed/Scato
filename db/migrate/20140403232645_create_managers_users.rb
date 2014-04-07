class CreateManagersUsers < ActiveRecord::Migration
  def change
    create_table :managers_users do |t|
    	t.references :user
    	t.references :manager, class: :user
    end
  end
end
