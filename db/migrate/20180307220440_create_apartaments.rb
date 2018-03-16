class CreateApartaments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartaments do |t|
      t.string :adres
      t.integer :koszt_najmu
      t.integer :czas_trwania_umowy
      t.timestamps
    end
  end
end
