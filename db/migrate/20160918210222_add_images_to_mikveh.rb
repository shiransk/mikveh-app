class AddImagesToMikveh < ActiveRecord::Migration[5.0]
  def change
    add_column :mikvehs, :image, :string
    add_column :users, :image, :string
  end
end
