class AddRabiColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rabbi, :boolean,  default: :false
  end
end
