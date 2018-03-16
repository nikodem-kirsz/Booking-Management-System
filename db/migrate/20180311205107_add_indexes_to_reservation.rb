class AddIndexesToReservation < ActiveRecord::Migration[5.1]
  def change
    add_index :reservations, :numer
    add_index :reservations, :status
    add_index :reservations, :zrodlo
    add_index :reservations, :pracownik
    add_index :reservations, :klient
    add_index :reservations, :oferte_wprowadzil
    add_index :apartaments, :adres
  end
end