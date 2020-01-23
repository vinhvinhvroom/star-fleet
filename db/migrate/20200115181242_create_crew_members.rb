class CreateCrewMembers < ActiveRecord::Migration[5.2]
  def change
     create_table :crew_members do |t|
       t.belongs_to :starship
       t.string :first_name, null: false
       t.string :last_name, null: false
       t.string :speciality_division, null: false 
     end
  end
end
