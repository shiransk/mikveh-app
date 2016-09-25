class ChangeRoomToPhoneNumberInMikvehModel < ActiveRecord::Migration[5.0]

  def change
    rename_column :mikvehs, :rooms, :phone_number
  end

end
