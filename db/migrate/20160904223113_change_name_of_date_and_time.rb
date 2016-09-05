class ChangeNameOfDateAndTime < ActiveRecord::Migration[5.0]
  def change
    rename_column :bookings, :date_and_time, :start_time
  end
end
