class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :mikveh_id
      t.integer :user_id
      t.integer :time
      t.string :room

      t.timestamps
    end
  end
end
