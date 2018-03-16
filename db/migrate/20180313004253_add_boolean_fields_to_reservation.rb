class AddBooleanFieldsToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :transport_z_lotniska, :boolean, default: false
    add_column :reservations, :transport_na_lotnisko, :boolean, default: false
    add_column :reservations, :parking, :boolean, default: false
    add_column :reservations, :wycieczka, :boolean, default: false
    add_column :reservations, :lozeczko_dla_dziecka, :boolean, default: false
  end
end
