class AddApartamentIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :apartament_id, :integer
    add_index :reservations, :apartament_id
  end
end
