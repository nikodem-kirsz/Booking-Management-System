require 'prawn'

TABLE_FONT_SIZE = 10
SMALL_CELLS_FONT_SIZE = 8

class ReservationPdf < Prawn::Document
  def initialize(reservation)
    super()
    @reservation = reservation
    text "Karta pobytu / Residence card", :size => 20, :align => :center
    move_down  10
    personal_info
    move_down 15
    reservation_info
    move_down 14
    addiitonal_info
    move_down 25
    text "PODPIS WYNAJMUJACEGO / SIGNATURE:                 ........................................................", :size => 12, :align => :left
    text "KRAKOW, DNIA / DATE:                                                                     2018-02-16", :size => 12, :align => :left
    move_down 8
    text "Potwierdzam odbiór gotowki w wysokosci: /", :size => 10, :align => :left
    text "Confirm receipt of cash in amount of: /", :size => 10, :align => :left
    text "2018-02-16", :size => 8, :align => :right

  end

  def personal_info
    table personal_information do
      cells.border_width = 1
      before_rendering_page do |page|
        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2
      end
      row(5).height = 50
      style(cells).size = TABLE_FONT_SIZE
      column(1).style :align => :center
      column(1).width = 320
      column(0).width = 220
      column(1).size = 11
      self.header = true
    end
  end

  def reservation_info
    table reservation_information do
      cells.border_width = 1
      before_rendering_page do |page|
        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2
      end
      style(cells).size = TABLE_FONT_SIZE
      column(1).style :align => :center
      column(1).width = 320
      column(0).width = 220
      column(1).size = 11
      # column(0).width = 180
      # self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
      # style(row(1..14), :size => 8)
    end
  end

  def addiitonal_info
    table additional_information do
      cells.border_width = 1
      before_rendering_page do |page|
        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2
      end
      style(cells).size = TABLE_FONT_SIZE
      column(1).style :align => :center
      column(1).width = 320
      column(0).width = 220
      column(1).size = 11
      # column(0).width = 180
      # self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
      # style(row(1..14), :size => 8)
    end
  end

  def personal_information
    [
        ['NAZWA I ADRES LOKALU / ADRESS OF THE APARTMENT', @reservation.id],
        ['NUMER REZERWACJI / BOOKING NUMBER', @reservation.numer],
        ['OSOBA REZERWUJACA / BOOKING PERSON', @reservation.klient],
        ['NR DOWODU / ID NUMBER', '421411'],
        ['PESEL / PESEL NUMBER', '9233701731'],
        ['ADRES / ADRESS', 'bobas'],
        ['NUMER TELEFONU / PHONE NUMBER', '656464'],
        ['EMAIL', 'bobas']
    ]
  end

  def reservation_information
    arrival_date = make_table([["DATA/DATE", "GODZINA/HOUR"], ["30-01-19", "18:00"]], :cell_style => { :overflow => :shrink_to_fit, :min_font_size => 8,
                                                                                                              :width => 160, :height => 30, :size => TABLE_FONT_SIZE, :align => :center })
    departure = make_table([["DATA/DATE", "GODZINA/HOUR"], ["30-01-19", "18:00"]], :cell_style => { :overflow => :shrink_to_fit, :min_font_size => 9,
                                                                                                    :width => 160, :height => 30, :size => TABLE_FONT_SIZE, :align => :center })
    payment = make_table([["Calkowity koszt/\ntotal cost", "Wplacona kwota/\nPaid ammount", "Do zaplaty/\nTo pay", "Parking",
                "Transfer", "Inne/\nOther", "Lacznie/\nTotal to pay"],
                          ["<font size='12'>288</font>", "<font size='12'>288</font>", "<font size='12'>0</font>", "<font size='10'>Nie/No</font>", "<font size='10'>Tak/Yes</font>", "", "<font size='12'>288</font>"]
               ], :cell_style => { :overflow => :shrink_to_fit, :inline_format => true,
                                   :width => 45.7, :height => 50, :size => SMALL_CELLS_FONT_SIZE }) # 42.8


    [
        ['DATA PRZYJAZDU / DATE OF ARRIVAL', arrival_date],
        ['DATA WYJAZDU / DEPARTURE DATE', departure],
        ['KWOTA DO ZAPLATY / PAYMENT PRICE', payment],
        ['ILOSC OSÓB/QUANTITY OF PEOPLE', '2']
    ]
  end

  def additional_information
    wifi = make_table([["Nazwa sieci/network", "Apartamenty Hash"], ["Haslo/password", "luna"]], :cell_style => { :overflow => :shrink_to_fit, :min_font_size => 8,
                                                                                                                  :width => 160, :height => 30, :size => TABLE_FONT_SIZE, :align => :center })
    [['WIFI', wifi],
     ['TELEFON DO OBSLUGI / PHONE NUMBER TO THE SERVICE', '3211511']]
  end

end