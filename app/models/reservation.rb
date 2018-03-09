class Reservation < ApplicationRecord
  searchkick
  belongs_to :apartament

  def self.search(search)
    if search
      where(["zrodlo LIKE ?","%#{search}%"])
    else
      all
    end
  end

  def self.search_reservations(params)

    reservations = Reservation.all

    reservations = reservations.joins(:apartament).where(["adres LIKE ?", "%#{params[:apartament]}%"]) if params[:apartament].present?
    reservations = reservations.where(["zrodlo LIKE ?", "%#{params[:zrodlo]}%"]) if params[:zrodlo].present?
    reservations = reservations.where(["oferte_wprowadzil:  LIKE ?", "%#{params[:oferte_wprowadzil]}%"]) if params[:oferte_wprowadzil].present?
    reservations = reservations.where(["pracownik LIKE ?", "%#{params[:pracownik]}%"]) if params[:pracownik].present?

    return reservations
  end
end
