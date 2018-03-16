class CreateKlients < ActiveRecord::Migration[5.1]
  def change
    create_table :klients do |t|
      t.string :imie
      t.string :nazwisko
      t.string :numer_telefonu
      t.string :email
      t.string :nazwa_firmy
      t.string :kod_pocztowy
      t.string :ulica
      t.string :miasto
      t.string :numer_nip
      t.string :kod_kraju

      t.timestamps
    end
  end
end
