class RemoveNullFalseFromSpecialtyDivision < ActiveRecord::Migration[5.2]
  def up
    change_column :crew_members, :speciality_division, :string, null: true
  end

  def down
    change_column :crew_members, :speciality_division, :string, null: false
  end
end
