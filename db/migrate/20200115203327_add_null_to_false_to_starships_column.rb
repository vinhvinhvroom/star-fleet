class AddNullToFalseToStarshipsColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :starships, :name,:string, null: false
    change_column :starships, :ship_class,:string, null: false
    change_column :starships, :location,:string, null: false
  end

  def down
    change_column :starships, :name,:string
    change_column :starships, :ship_class,:string
    change_column :starships, :location,:string  
  end
end
