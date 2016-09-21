class AddColumnsToMikveh < ActiveRecord::Migration[5.0]
  def change
    add_column :mikvehs, :supervision, :string
    add_column :mikvehs, :shul, :string
  end
end
