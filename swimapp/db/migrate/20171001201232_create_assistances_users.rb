class CreateAssistancesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :assistances_users, :id => false do |t|
      t.references :user, foreign_key: true
      t.references :assistance, foreign_key: true

      t.timestamps
    end
  end
end
