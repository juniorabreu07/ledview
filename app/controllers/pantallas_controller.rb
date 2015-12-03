class PantallasController < ApplicationController
  before_action :set_pantalla, only: [:show, :edit, :update, :destroy]

  # GET /pantallas
  # GET /pantallas.json
  def index
    if params[:codigo]
      @pantallas = Pantalla.where(["codigo = :codigo", {codigo: params[:codigo]}])
    else
      @pantallas = Pantalla.all
    end
  end

  # GET /pantallas/1
  # GET /pantallas/1.json
  def show
  end

  # GET /pantallas/new
  def new
    @pantalla = Pantalla.new
  end

  # GET /pantallas/1/edit
  def edit
  end

  # POST /pantallas
  # POST /pantallas.json
  def create
    @pantalla = Pantalla.new(pantalla_params)

    respond_to do |format|
      if @pantalla.save
        format.html { redirect_to @pantalla, notice: 'Pantalla se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @pantalla }
      else
        format.html { render :new }
        format.json { render json: @pantalla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pantallas/1
  # PATCH/PUT /pantallas/1.json
  def update
    respond_to do |format|
      if @pantalla.update(pantalla_params)
        format.html { redirect_to @pantalla, notice: 'Pantalla se ha actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @pantalla }
      else
        format.html { render :edit }
        format.json { render json: @pantalla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pantallas/1
  # DELETE /pantallas/1.json
  def destroy
    @pantalla.destroy
    respond_to do |format|
      format.html { redirect_to pantallas_url, notice: 'Pantalla fue eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pantalla
      @pantalla = Pantalla.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pantalla_params
      params.require(:pantalla).permit(:tiempo, :provincia_id, :descripcion,:configurada,:Codigo)
    end
end
