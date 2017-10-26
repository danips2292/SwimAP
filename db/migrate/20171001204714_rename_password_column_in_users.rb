class RenamePasswordColumnInUsers < ActiveRecord::Migration[5.0]
  def up
  	remove_column :users, "encrypted_password"
  	add_column :users, "password_digest", :string , :default => ""
  end

  def down
  	add_column :users, "encrypted_password", :string , :default => ""
  	remove_column :users, "password_digest"
  end
end
