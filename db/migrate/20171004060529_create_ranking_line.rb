class CreateRankingLine < ActiveRecord::Migration[5.0]
  def change
    create_table :ranking_lines do |t|
    	t.references  :user 
    	t.string :style
    	t.string :time
    	t.string :distance  
    end
  end
end
