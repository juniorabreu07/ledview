class AnunciosController < ApplicationController
  before_action :set_anuncio, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /anuncios
  # GET /anuncios.json
  def index
    @anuncios = current_user.anuncios
    # @anuncioProvincia = AnuncioProvincia.all
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

    if anuncio_params[:usuario_id].blank?
      @anuncio.cliente_id = current_user.id
    end

    respond_to do |format|
      if @anuncio.save
        format.html { redirect_to @anuncio, notice: 'Anuncio se ha creado correctamente.' }
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
      
    archivo = params[:anuncio][:archivo] 
    params[:anuncio].delete(:archivo)
    file = parse_image_data( archivo ) if archivo
    params[:anuncio][:cfile] = file if anuncio_params[:tipo] == 'Imagen'
    params[:anuncio][:video] = file if anuncio_params[:tipo] == 'Video'
    
    respond_to do |format|
      if @anuncio.update(anuncio_params)
        format.html { redirect_to @anuncio, notice: 'Anuncio se ha actualizado correctamente.' }
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
      format.html { redirect_to anuncios_url, notice: 'Anuncio fue eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private

  def parse_image_data(filedata)
    Rails.logger.info 'decoding now'
    decoded_data = Base64.decode64(filedata[:data])
    # create 'file' understandable by Carrierwave
    @tempfile = Tempfile.new('task-image')
    @tempfile.binmode
    @tempfile.write decoded_data
    @tempfile.rewind   
    ActionDispatch::Http::UploadedFile.new(
      :tempfile => @tempfile,
      :content_type => filedata[:type],
      :filename => filedata[:name]
      )
   end

   def clean_tempfile
      if @tempfile
         @tempfile.close
         @tempfile.unlink
       end
   end

    # Use callbacks to share common setup or constraints between actions.
    def set_anuncio
      @anuncio = Anuncio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anuncio_params
      params.require(:anuncio).permit(:descripcion, :texto, :usuario_id, :estado, :fecha_end, :hora, :precio, :cfile, :video, :tipo, anuncios_provincia_attributes: [:id, :anuncio_id, :provincia_id, :_destroy])
    end
end
