class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :founder
      t.string :city
      t.string :country
      t.string :postal_code
      t.string :street
      t.string :photo_link
      t.decimal :latitude
      t.decimal :longitude
      t.text :description
    end
  end
end
