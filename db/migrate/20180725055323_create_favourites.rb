class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites do |t|
      t.references :patron, foreign_key: true

      t.timestamps
    end
  end
end
