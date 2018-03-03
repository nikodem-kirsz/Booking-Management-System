require 'prawn'
class ReservationPdf < Prawn::Document
  def initialize(reservation)
    super(top_margin: 70)
    @reservation = reservation
    reservation_info
  end

  def reservation_info
    table reservation_information do
      style(cells).size = 12
      column(1).width = 300
      # column(0).width = 180
      row(0).font_style = :bold
      # self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
      # style(row(1..14), :size => 8)
    end
  end

  def reservation_information
    arrival_date = make_table([["DATA/DATE</font>", "30-01-19"], ["GODZINA/HOUR", "18:00"]], :cell_style => { :overflow => :shrink_to_fit, :min_font_size => 8,
                                                                                                              :width => 30, :height => 30 })
    departure = make_table([["DATA/DATE", "30-01-19"], ["GODZINA/HOUR", "18:00"]], :cell_style => { :overflow => :shrink_to_fit, :min_font_size => 8,
                                                                                                    :width => 30, :height => 30 })
    payment = make_table([["Calkowity koszt/ total cost", "Wplacone zadatki/Paid", "Do zaplaty/to pay", "Parking",
                "Zakwaterowanie po 18/Accomodation at 18", "Inne/Other", "Lacznie/Total to pay"],
                          ["Calkowity koszt/ total cost", "Wplacone zadatki/Paid", "Do zaplaty/to pay", "Parking",
                           "Zakwaterowanie po 18/Accomodation at 18", "Inne/Other", "Lacznie/Total to pay"]
               ], :cell_style => { :overflow => :shrink_to_fit, :min_font_size => 3,
                                   :width => 45, :height => 50 }) # 42.8
    wifi = make_table([["Nazwa sieci/network", "Apartamenty Hash"], ["Haslo/password", "luna"]], :cell_style => { :overflow => :shrink_to_fit, :min_font_size => 8,
                                                                                                                  :width => 30, :height => 30 })

    [
        ['KARTA POBYTU/RESIDENCE CARD'],
        ['NAZWA I ADRES LOKALU / ADRESS OF THE APARTMENT', @reservation.id],
        ['NUMER REZERWACJI / BOOKING NUMBER', @reservation.numer],
        ['OSOBA REZERWUJACA / BOOKING PERSON', @reservation.klient],
        ['NR DOWODU / ID NUMBER', '421411'],
        ['PESEL / PESEL NUMBER', '9233701731'],
        ['ADRES / ADRESS', 'bobas'],
        ['NUMER TELEFONU / PHONE NUMBER', '656464'],
        ['EMAIL', 'bobas'],
        ['DATA PRZYJAZDU / DATE OF ARRIVAL', arrival_date],
        ['DATA WYJAZDU / DEPARTURE DATE', departure],
        ['KWOTA DO ZAPLATY / PAYMENT PRICE', payment],
        ['ILOSC OSÓB/QUANTITY OF PEOPLE', '2'],
        ['WIFI', wifi],
        ['TELEFON DO OBSLUGI / PHONE NUMBER TO THE SERVICE', '3211511']

    ]
  end

end