class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.date :birthday
      t.string :fav_food

      t.timestamps
    end
  end
end
