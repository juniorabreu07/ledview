class AnunciosController < ApplicationController
  before_action :set_anuncio, only: [:show, :edit, :update, :destroy]

  # GET /anuncios
  # GET /anuncios.json
  def index
    @anuncios = Anuncio.all
  end

  # GET /anuncios/1
  # GET /anuncios/1.json
  def show
  end

  # GET /anuncios/new
  def new
    @anuncio = Anuncio.new
  end

  # GET /anuncios/1/edit
  def edit
  end

  # POST /anuncios
  # POST /anuncios.json
  def create
    @anuncio = Anuncio.new(anuncio_params)

    respond_to do |format|
      if @anuncio.save
        format.html { redirect_to @anuncio, notice: 'Anuncio was successfully created.' }
        format.json { render :show, status: :created, location: @anuncio }
      else
        format.html { render :new }
        format.json { render json: @anuncio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anuncios/1
  # PATCH/PUT /anuncios/1.json
  def update
    respond_to do |format|
      if @anuncio.update(anuncio_params)
        format.html { redirect_to @anuncio, notice: 'Anuncio was successfully updated.' }
        format.json { render :show, status: :ok, location: @anuncio }
      else
        format.html { render :edit }
        format.json { render json: @anuncio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anuncios/1
  # DELETE /anuncios/1.json
  def destroy
    @anuncio.destroy
    respond_to do |format|
      format.html { redirect_to anuncios_url, notice: 'Anuncio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anuncio
      @anuncio = Anuncio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anuncio_params
      params.require(:anuncio).permit(:descripcion, :texto, :cliente_id, :estado, :fecha_end, :hora, :precio, :cfile, :tipo)
    end
end
