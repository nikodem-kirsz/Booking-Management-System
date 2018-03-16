class PlatnoscsController < ApplicationController
  before_action :set_platnosc, only: [:show, :edit, :update, :destroy]

  # GET /platnoscs
  # GET /platnoscs.json
  def index
    @platnoscs = Platnosc.all
  end

  # GET /platnoscs/1
  # GET /platnoscs/1.json
  def show
  end

  # GET /platnoscs/new
  def new
    @platnosc = Platnosc.new
  end

  # GET /platnoscs/1/edit
  def edit
  end

  # POST /platnoscs
  # POST /platnoscs.json
  def create
    @platnosc = Platnosc.new(platnosc_params)

    respond_to do |format|
      if @platnosc.save
        format.js { head(:ok) }
        format.json { render :show, status: :created, location: @platnosc }
      else
        format.html { render :new }
        format.json { render json: @platnosc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platnoscs/1
  # PATCH/PUT /platnoscs/1.json
  def update
    respond_to do |format|
      if @platnosc.update(platnosc_params)
        format.html { redirect_to @platnosc, notice: 'Platnosc was successfully updated.' }
        format.json { render :show, status: :ok, location: @platnosc }
      else
        format.html { render :edit }
        format.json { render json: @platnosc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platnoscs/1
  # DELETE /platnoscs/1.json
  def destroy
    @platnosc.destroy
    respond_to do |format|
      format.html { redirect_to platnoscs_url, notice: 'Platnosc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platnosc
      @platnosc = Platnosc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def platnosc_params
      params.permit(:zaliczka, :kwota, :termin_platnosci, :konto, :data_zaplaty, :podatek, :rodzaj_faktury, :data_wystawienia, :reservation_id)
    end
end
