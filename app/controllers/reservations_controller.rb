class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_options, only: [:index, :show, :edit, :new, :create, :update]
  FILTERS = [:szukaj, :keywords, :apartament, :zrodlo, :status, :oferte_wprowadzil, :pracownik, :data_zakwaterowania_od, :data_zakwaterowania_do, :data_wykwaterowania_od, :data_wykwaterowania_do, :data_zakwaterowania, :data_wykwaterowania]
  # GET /reservations
  # GET /reservations.json

  def index
    if params[:sort] && params[:direction]
      @reservations = Reservation.all.includes(:apartament)
                          .order(params[:sort] + " " + params[:direction])
                          .paginate(page: params[:page], per_page: 100)
    else
      filters = false
      FILTERS.each do |filter|
        if params[filter].present?
          filters = true
          break
        end
      end
      @reservations = if filters
                        Reservation.search_reservations(search_params)
                            .order(created_at: :desc)
                            .paginate(page: params[:page], per_page: 100)
                      else
                        Reservation.all.includes(:apartament)
                            .order(created_at: :desc)
                            .paginate(page: params[:page], per_page: 100)
                      end
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReservationPdf.new(@reservation)
        send_data pdf.render, filename: "Reservation Card #{@reservation.numer}", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def invoice
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = InvoicePdf.new(@reservation)
        send_data pdf.render, filename: "Invoice #{@reservation.numer}", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
      @reservation = Reservation.new(set_external_params(reservation_params))

      respond_to do |format|
        if @reservation.save
          format.html { redirect_to @reservation, success: 'Rezerwacja dodana' }
          format.json { render :show, status: :created, location: @reservation }
        else
          format.html { render :new }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(set_external_params(reservation_params))
        format.html { redirect_to @reservation, success: 'Rezerwacja zakutalizowana' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, danger: 'Rezerwacja usunieta' }
      format.json { head :no_content }
    end
  end

  def loadKlients
    return Klient.all
  end

  private

    def set_external_params(reservation_params)
      reservation = reservation_params
      reservation[:apartament] = Apartament.find_by(adres: reservation_params[:apartament])
      reservation[:data_zakwaterowania] = Time.zone.parse(params[:data_zakwaterowania] + " " + params[:godzina_zakwaterowania]) if params[:data_zakwaterowania].present?
      reservation[:data_wykwaterowania] = Time.zone.parse(params[:data_wykwaterowania] + " " + params[:godzina_wykwaterowania]) if params[:data_wykwaterowania].present?
      reservation[:godzina_przylotu] = Time.zone.parse(params[:godzina_przylotu]) if params[:godzina_przylotu].present?
      reservation[:godzina_wylotu] = Time.zone.parse(params[:godzina_wylotu]) if params[:godzina_wylotu].present?
      return reservation
    end

    def set_options
      @options = {
          zrodla: ["Booking", "Airbnb", "Expedia", "Bezpośrednia"],
          apartamenty: Apartament.distinct.pluck(:adres),
          pracownicy: Reservation.distinct.pluck(:pracownik),
          statusy: ["Rezerwacja", "Anulowanie"],
          klienci: Klient.all.pluck(:imie)
      }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:imie, :nazwisko, :numer_telefonu, :email, :nazwa_firmy, :ulica, :miasto, :numer_nip, :kod_kraju, :godzina_wylotu, :godzina_przylotu, :klient, :pracownik, :numer_przylotu, :komentarz_do_transportu_z_lotniska, :numer_wylotu, :komentarz_do_transportu_na_lotnisko, :komentarz_do_wycieczek, :numer, :status, :zrodlo, :kwota, :komentarz, :sprzatanie, :data_zakwaterowania, :godzina_zakwaterowania, :data_wykwaterowania, :godzina_wykwaterowania, :apartament, :ilosc_osob, :transport_z_lotniska, :transport_na_lotnisko, :parking, :wycieczka, :lozeczko_dla_dziecka)
    end

    def search_params
      params.permit(:utf8, :commit, :szukaj, :keywords, :apartament, :zrodlo, :status, :oferte_wprowadzil, :pracownik, :data_zakwaterowania_od, :data_zakwaterowania_do, :data_wykwaterowania_od, :data_wykwaterowania_do, :data_zakwaterowania, :data_wykwaterowania)
    end
end
