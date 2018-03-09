class CreateApartaments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartaments do |t|
      t.string :adres

      t.timestamps
    end
  end
end
