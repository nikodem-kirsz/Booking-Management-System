class Reservation < ApplicationRecord
  searchkick
  belongs_to :apartament

  def self.search_reservations(params)

    reservations = Reservation.all

    reservations = reservations.joins(:apartament).where(["adres LIKE ?", "%#{params[:apartament]}%"]) if params[:apartament].present? && params[:apartament] != '--Wszystkie--'
    reservations = reservations.where(["zrodlo LIKE ?", "%#{params[:zrodlo]}%"]) if params[:zrodlo].present? && params[:zrodlo] != '--Wszystkie--'
    reservations = reservations.where(["oferte_wprowadzil  LIKE ?", "%#{params[:oferte_wprowadzil]}%"]) if params[:oferte_wprowadzil].present? && params[:oferte_wprowadzil] != '--Wszystkie--'
    reservations = reservations.where(["pracownik LIKE ?", "%#{params[:pracownik]}%"]) if params[:pracownik].present? && params[:pracownik] != '--Wszystkie--'

    return reservations
  end
end
