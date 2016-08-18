class AddDateTimeToBokkings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :date_and_time, :datetime
  end
end
