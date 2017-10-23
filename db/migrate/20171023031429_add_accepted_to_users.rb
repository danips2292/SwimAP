class AddAcceptedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_accepted, :boolean, :default => false, :null => false
  end
end
