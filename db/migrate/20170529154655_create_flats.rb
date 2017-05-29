class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.text :description
      t.string :short_description
      t.integer :room_count
      t.references :user, foreign_key: true
      t.string :property_type
      t.integer :price
      t.integer :room_count
      t.string :country
      t.string :city
      t.string :street
      t.string :zipcode

      t.timestamps
    end
  end
end
