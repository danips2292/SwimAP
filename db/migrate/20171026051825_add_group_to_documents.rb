class AddGroupToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_reference :documents, :group, foreign_key: true
  end
end
