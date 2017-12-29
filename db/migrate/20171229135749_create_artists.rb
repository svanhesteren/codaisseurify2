class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :picture
      t.date :birthday
      t.string :fav_food
      # t.references :songs, foreign_key: true

      t.timestamps
    end
  end
end
