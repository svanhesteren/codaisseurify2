class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :album
      t.time :duration
      t.integer :rating

      t.timestamps
    end
  end
end
