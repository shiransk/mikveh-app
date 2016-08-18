class RemoveTimeFrom < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :time , :string
  end
end
