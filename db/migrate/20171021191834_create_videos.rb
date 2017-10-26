class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.references :user, :null => false
      t.string :link, :null => false
      t.string :comment, :null => false
      t.timestamps
    end
  end
end
