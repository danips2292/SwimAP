class AddCheckToAssistancesUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :assistances_users, :present, :boolean
  end
end
