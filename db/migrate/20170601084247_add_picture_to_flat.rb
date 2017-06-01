class AddPictureToFlat < ActiveRecord::Migration[5.0]
  def change
    add_column :flats, :picture, :string
  end
end
