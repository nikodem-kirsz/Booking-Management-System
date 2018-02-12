class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :numer
      t.string :status
      t.string :zrodlo
      t.integer :kwota
      t.text :komentarz
      t.text :sprzatanie
      t.date :data_zakwaterowania
      t.time :godzina_zakwaterowania
      t.date :data_wykwaterowania
      t.time :godzina_wykwaterowania
      t.string :apartament
      t.integer :ilosc_osob
      t.string :pracownik
      t.string :klient
      t.time :godzina_przylotu
      t.integer :numer_przylotu
      t.text :komentarz_do_transportu_z_lotniska
      t.time :godzina_wylotu
      t.time :numer_wylotu
      t.text :komentarz_do_transportu_na_lotnisko
      t.text :komentarz_do_wycieczek
      t.string :oferte_wprowadzil
      t.date :data_wprowadzenia
      t.timestamps
    end
  end
end
