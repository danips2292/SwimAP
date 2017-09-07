class AddDetailsToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :name, :string
    add_column :groups, :tip_group, :string
    add_column :groups, :schedule, :string
  end
end
