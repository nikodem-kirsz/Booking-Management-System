class CreatePlatnoscs < ActiveRecord::Migration[5.1]
  def change
    create_table :platnoscs do |t|
      t.string :zaliczka
      t.integer :kwota
      t.string :termin_platnosci
      t.string :konto
      t.string :data_zaplaty
      t.string :podatek
      t.string :rodzaj_faktury
      t.string :data_wystawienia
      t.timestamps
    end
  end
end
