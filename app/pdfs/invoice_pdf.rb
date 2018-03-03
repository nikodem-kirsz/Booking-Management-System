require 'prawn'

FONT_SIZE = 12
HEADLINE_FONT_SIZE = 15
TABLE_FONT_SIZE = 14

class InvoicePdf < Prawn::Document
  def initialize(reservation)
    super()
    @reservation = reservation
    text "                 Miejsce wystawienia: <b>Krakow</b>", :size => 10, :align => :right, :inline_format => true
    text "                 Data wystawienia: <b>2019-01-01</b>", :size => 10, :align => :right, :inline_format => true
    text "Data sprzedazy / wykonania uslugi: <b>2019-01-01</b>", :size => 10, :align => :right, :inline_format => true
    text "                 Data zakonczenia: <b>2019-01-01</b>", :size => 10, :align => :right, :inline_format => true
    move_down  50
    horizontal_line 0, 600, :at => 600
    text "Faktura nr: 1/01-2019", :size => 20, :align => :left
    horizontal_line 0, 600, :at => 630
    move_down 15
    text "Numer rezerwacji: 231314", :size => 12, :align => :left
    move_down 30
    text "<b>Wynajmujacy</b>", :size => HEADLINE_FONT_SIZE, :align => :left, :inline_format => true
    text "<b>Hash Cracow Apartments</b>", :size => FONT_SIZE, :align => :left, :inline_format => true
    text "<b>Kraków Mazowiecka 68A</b>", :size => FONT_SIZE, :align => :left, :inline_format => true
    text "<b>NIP: </b>3123441414", :size => FONT_SIZE, :align => :left, :inline_format => true
    text "<b>tel: </b>31215151", :size => FONT_SIZE, :align => :left, :inline_format => true
    text "<b>email: </b>hash@apartments.com", :size => FONT_SIZE, :align => :left, :inline_format => true
    text "<b>Bank: </b>ING", :size => FONT_SIZE, :align => :left, :inline_format => true
    text "<b>Nr konta: </b>3213131515151", :size => FONT_SIZE, :align => :left, :inline_format => true
    text "<b>Nr Swift: </b>3131313132131", :size => FONT_SIZE, :align => :left, :inline_format => true

    draw_text"Najemca", :size => HEADLINE_FONT_SIZE, :style => :bold, :at => [250, 530]
    draw_text"Hash Cracow Apartments", :size => FONT_SIZE, :style => :bold, :at => [250, 515]
    draw_text"Kraków Mazowiecka 68A", :size => FONT_SIZE, :style => :bold, :at => [250, 501]
    draw_text"NIP:", :size => FONT_SIZE, :style => :bold, :at => [250, 487]
    draw_text"TEL:", :size => FONT_SIZE, :style => :bold, :at => [250, 473]
    draw_text"email:", :size => FONT_SIZE, :style => :bold, :at => [250, 459]
    draw_text"Bank:", :size => FONT_SIZE, :style => :bold, :at => [250, 445]
    draw_text"Nr konta:", :size => FONT_SIZE, :style => :bold, :at => [250, 431]
    draw_text"Nr Swift:", :size => FONT_SIZE, :style => :bold, :at => [250, 417]

    # draw_text"Nabywca", :size => FONT_SIZE, :at => [310, 515]
    # draw_text"Nabywca", :size => FONT_SIZE, :at => [310, 501]
    draw_text"3123441414", :size => FONT_SIZE, :at => [310, 487]
    draw_text"525235223", :size => FONT_SIZE, :at => [310, 473]
    draw_text"nikodem.kirsz@mail.com", :size => FONT_SIZE, :at => [310, 459]
    draw_text"ING", :size => FONT_SIZE, :at => [310, 445]
    draw_text"3131313132131", :size => FONT_SIZE, :at => [310, 431]
    draw_text"3131313132131", :size => FONT_SIZE, :at => [310, 417]

    move_down 50

    payments_info

    move_down 60
    text "Sposob zaplaty: przelew", :size => 12, :align => :right
    text "Termin zaplaty: zaplacono", :size => 12, :align => :right
    move_down 10
    text "Do zaplaty: 260.57 PLN", :size => 15, :align => :right, :style => :bold
    move_down 40
    text "---------------------------------------------------", :size => 10, :align => :right
    text "Osoba upowazniona do wystawienia", :size => 11, :align => :right
  end

  def payments_info
    table payments do
      cells.border_width = 1
      before_rendering_page do |page|
        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2
      end
      row(0).height = 50
      style(cells).size = TABLE_FONT_SIZE
      column(1).style :align => :center
      column(1).size = 11
      self.header = true
    end
  end

  def payments
    [
        ['lp', 'Nazwa uslugi', 'Ilosc', 'Jednostka', 'Cena netto', 'Podatek', 'Kwota netto', 'Kwota podatku', 'Kwota brutto'],
        ['1', 'Wynajem', '1', 'Doba', '800zl', '19%', '800zl', '100zl', '900zl'],
        ['1', 'Wynajem', '1', 'Doba', '800zl', '19%', '800zl', '100zl', '900zl'],
        ['1', 'Wynajem', '1', 'Doba', '800zl', '19%', '800zl', '100zl', '900zl'],

    ]
  end

end