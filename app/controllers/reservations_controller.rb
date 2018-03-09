class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  FILERS = [:search, :keywords, :apartament, :zrodlo, :status, :oferte_wprowadzil, :pracownik, :data_zakwaterowania_od, :data_zakwaterowania_do, :data_wykwaterowania_od, :data_wykwaterowania_do]
  # GET /reservations
  # GET /reservations.json
  def index
    @zrodla = Reservation.distinct.pluck(:zrodlo)
    @apartamenty = Reservation.joins(:apartament).distinct.pluck(:adres)
    @pracownicy = Reservation.distinct.pluck(:pracownik)
    search = params[:search].present? ? params[:search] : nil
    filters = FILERS.each {|filter| params[filter].present? ? true : nil}
    @reservations = if search
                      Reservation.search(search)
                    elsif filters
                           Reservation.search_reservations(search_params)
                    else
                      Reservation.all
                    end
    # if(params[:search])
    #   @reservations = Reservation.search_reservations(params[:search])
    # else
    #   @reservations = Reservation.all
    # end
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
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
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
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
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
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:numer, :status, :zrodlo, :kwota, :komentarz, :sprzatanie, :data_zakwaterowania, :godzina_zakwaterowania, :data_wykwaterowania, :godzina_wykwaterowania, :apartament, :ilosc_osob)
    end

    def search_params
      params.permit(:search, :keywords, :apartament, :zrodlo, :status, :oferte_wprowadzil, :pracownik, :data_zakwaterowania_od, :data_zakwaterowania_do, :data_wykwaterowania_od, :data_wykwaterowania_do)
    end
end
