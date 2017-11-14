class AddRecoveryToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :token5, :string
  	add_column :users, :token10, :string
  end
end
