class Reservation < ApplicationRecord
  searchkick
  belongs_to :apartament

  def self.search_reservations(params)

    reservations = Reservation.none

    if params[:szukaj] != ""

      params[:szukaj].downcase!

      if (results= where(["LOWER(klient) LIKE ?", "%#{params[:szukaj]}%"])).count > 0
        reservations = results
      elsif (results = joins(:apartament).where(["LOWER(adres) LIKE ?", "%#{params[:szukaj]}%"])).count > 0
        reservations = results
      elsif (results = where(["LOWER(zrodlo) LIKE ?", "%#{params[:szukaj]}%"])).count > 0
        reservations = results
      elsif (results = where(["LOWER(pracownik) LIKE ?", "%#{params[:szukaj]}%"])).count > 0
        reservations = results
      elsif (results = where(["LOWER(oferte_wprowadzil) LIKE ?", "%#{params[:szukaj]}%"])).count > 0
        reservations = results
      elsif (results = where(["LOWER(status) LIKE ?", "%#{params[:szukaj]}%"])).count > 0
        reservations = results
      end
    end

    if params[:szukaj] != "" && reservations.empty?
      reservations = Reservation.none
    elsif params[:szukaj] != "" && !reservations.empty?
      reservations = reservations.joins(:apartament).where(["adres LIKE ?", "%#{params[:apartament]}%"]) if params[:apartament].present? && params[:apartament] != '--Wszystkie--'
      reservations = reservations.where(["zrodlo LIKE ?", "%#{params[:zrodlo]}%"]) if params[:zrodlo].present? && params[:zrodlo] != '--Wszystkie--'
      reservations = reservations.where(["status LIKE ?", "%#{params[:status]}%"]) if params[:status].present? && params[:status] != '--Wszystkie--'
      reservations = reservations.where(["oferte_wprowadzil  LIKE ?", "%#{params[:oferte_wprowadzil]}%"]) if params[:oferte_wprowadzil].present? && params[:oferte_wprowadzil] != '--Wszystkie--'
      reservations = reservations.where(["pracownik LIKE ?", "%#{params[:pracownik]}%"]) if params[:pracownik].present? && params[:pracownik] != '--Wszystkie--'
      reservations = reservations.where(["data_zakwaterowania >= ?", "#{Time.parse(params[:data_zakwaterowania_od])}"]) if params[:data_zakwaterowania_od].present?
      reservations = reservations.where(["data_zakwaterowania <= ?", "#{Time.parse(params[:data_zakwaterowania_do])}"]) if params[:data_zakwaterowania_do].present?
      reservations = reservations.where(["data_wykwaterowania >= ?", "#{Time.parse(params[:data_wykwaterowania_od])}"]) if params[:data_wykwaterowania_od].present?
      reservations = reservations.where(["data_wykwaterowania <= ?", "#{Time.parse(params[:data_wykwaterowania_do])}"]) if params[:data_wykwaterowania_do].present?
      reservations = reservations.where(["CAST(data_zakwaterowania as DATE) = ?", "#{Date.parse(params[:data_zakwaterowania])}"]) if params[:data_zakwaterowania].present?
      reservations = reservations.where(["CAST(data_wykwaterowania as DATE) = ?", "#{Date.parse(params[:data_wykwaterowania])}"]) if params[:data_wykwaterowania].present?
    elsif params[:szukaj] == ""
      reservations = Reservation.all
      reservations = reservations.joins(:apartament).where(["adres LIKE ?", "%#{params[:apartament]}%"]) if params[:apartament].present? && params[:apartament] != '--Wszystkie--'
      reservations = reservations.where(["zrodlo LIKE ?", "%#{params[:zrodlo]}%"]) if params[:zrodlo].present? && params[:zrodlo] != '--Wszystkie--'
      reservations = reservations.where(["status LIKE ?", "%#{params[:status]}%"]) if params[:status].present? && params[:status] != '--Wszystkie--'
      reservations = reservations.where(["oferte_wprowadzil  LIKE ?", "%#{params[:oferte_wprowadzil]}%"]) if params[:oferte_wprowadzil].present? && params[:oferte_wprowadzil] != '--Wszystkie--'
      reservations = reservations.where(["pracownik LIKE ?", "%#{params[:pracownik]}%"]) if params[:pracownik].present? && params[:pracownik] != '--Wszystkie--'
      reservations = reservations.where(["data_zakwaterowania >= ?", "#{Time.parse(params[:data_zakwaterowania_od])}"]) if params[:data_zakwaterowania_od].present?
      reservations = reservations.where(["data_zakwaterowania <= ?", "#{Time.parse(params[:data_zakwaterowania_do])}"]) if params[:data_zakwaterowania_do].present?
      reservations = reservations.where(["data_wykwaterowania >= ?", "#{Time.parse(params[:data_wykwaterowania_od])}"]) if params[:data_wykwaterowania_od].present?
      reservations = reservations.where(["data_wykwaterowania <= ?", "#{Time.parse(params[:data_wykwaterowania_do])}"]) if params[:data_wykwaterowania_do].present?
      reservations = reservations.where(["CAST(data_zakwaterowania as DATE) = ?", "#{Date.parse(params[:data_zakwaterowania])}"]) if params[:data_zakwaterowania].present?
      reservations = reservations.where(["CAST(data_wykwaterowania as DATE) = ?", "#{Date.parse(params[:data_wykwaterowania])}"]) if params[:data_wykwaterowania].present?
    end

    return reservations
  end

end
