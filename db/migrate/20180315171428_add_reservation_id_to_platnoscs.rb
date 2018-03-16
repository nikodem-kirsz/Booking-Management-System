class AddReservationIdToPlatnoscs < ActiveRecord::Migration[5.1]
  def change
    add_column :platnoscs, :reservation_id, :integer
    add_index :platnoscs, :reservation_id
  end
end
