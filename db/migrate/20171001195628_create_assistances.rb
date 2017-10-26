class CreateAssistances < ActiveRecord::Migration[5.0]
  def change
    create_table :assistances do |t|
    	t.string :name
    	t.references :group
    end
  end
end
