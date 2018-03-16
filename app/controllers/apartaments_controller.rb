class ApartamentsController < ApplicationController
  before_action :set_apartament, only: [:show, :edit, :update, :destroy]

  # GET /apartaments
  # GET /apartaments.json
  def index
    @apartaments = Apartament.includes(:reservations)
  end

  # GET /apartaments/1
  # GET /apartaments/1.json
  def show
  end

  # GET /apartaments/new
  def new
    @apartament = Apartament.new
  end

  # GET /apartaments/1/edit
  def edit
  end

  # POST /apartaments
  # POST /apartaments.json
  def create
    @apartament = Apartament.new(apartament_params)

    respond_to do |format|
      if @apartament.save
        format.html { redirect_to @apartament, notice: 'Apartament was successfully created.' }
        format.json { render :show, status: :created, location: @apartament }
      else
        format.html { render :new }
        format.json { render json: @apartament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartaments/1
  # PATCH/PUT /apartaments/1.json
  def update
    respond_to do |format|
      if @apartament.update(apartament_params)
        format.html { redirect_to @apartament, notice: 'Apartament was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartament }
      else
        format.html { render :edit }
        format.json { render json: @apartament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartaments/1
  # DELETE /apartaments/1.json
  def destroy
    @apartament.destroy
    respond_to do |format|
      format.html { redirect_to apartaments_url, notice: 'Apartament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartament
      @apartament = Apartament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartament_params
      params.require(:apartament).permit(:adres)
    end
end
