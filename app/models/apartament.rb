class Apartament < ApplicationRecord
  has_many :reservations

  validates_presence_of :adres

  def total_money
    self.reservations.sum(:kwota)
  end

  def koszt_trwania_umowy
    self.koszt_najmu * self.czas_trwania_umowy
  end

  def zrezlizowane_rezerwacje
    self.reservations.where("data_wykwaterowania < ?", "#{Time.now}").count
  end

  def aktywne_rezerwacje
    self.reservations.where("data_wykwaterowania >= ?", "#{Time.now}").count
  end
end
