class CreateStarships < ActiveRecord::Migration[5.2]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :ship_class
      t.string :location
    end
  end
end
