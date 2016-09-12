class AddLatitudeAndLongitudeToMikveh < ActiveRecord::Migration[5.0]
  def change
    add_column :mikvehs, :latitude, :float
    add_column :mikvehs, :longitude, :float
  end
end
