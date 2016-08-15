class CreateMikvehs < ActiveRecord::Migration[5.0]
  def change
    create_table :mikvehs do |t|
      t.string :name
      t.string :location
      t.string :rooms
      t.integer :user_id

      t.timestamps
    end
  end
end
