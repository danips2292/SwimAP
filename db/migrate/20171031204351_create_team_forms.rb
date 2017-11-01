class CreateTeamForms < ActiveRecord::Migration[5.0]
  def up
    create_table :team_forms do |t|
    	t.references :user, foreign_key: true, null: false
    	t.string :career
    	t.string :gender
    	t.string :local_id
    	t.string :passport_id
    	t.string :tec_id
    	t.string :birth_date
    	t.integer :weight_kg
    	t.integer :height_cm
    	t.integer :age
    	t.string :blood_type
    	t.boolean :right_handed
    	t.string :emergency_contact_name
    	t.string :local_id_receiver
    	t.string :relation_type
    	t.string :last_edition_national_games
    	t.string :last_edition_university_team
    	t.string :las_edition_national_team
    	t.string :city_of_origin
    	t.string :residence_location
      t.timestamps
    end
  end

  def down
  	drop_table :team_forms
  end
end
