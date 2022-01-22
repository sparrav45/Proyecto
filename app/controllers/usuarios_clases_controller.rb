class UsuariosClasesController < ApplicationController

  before_action :authorized, only: [:index,:edit, :update]
  before_action :find_usuario_and_usuarios_clase

  # GET /usuarios
  # GET /usuarios.json
  def index
    if current_user.rol_id == 1
      #@usuarios_clases = UsuariosClase.all
      @usuarios_clases = @usuario.usuarios_clases.all
    elsif current_user.rol_id == 2
      @usuarios_clases = UsuariosClase.where usuario_id: current_user.id
      #@usuarios_clases = @usuario.usuarios_clases.all
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create

    @usuarios_clase = UsuariosClase.new(usuario_clase_params)
    @usuarios_clase.usuario_id = @usuario.id

    @usuario.save
    
    session[:usuario_id] = @usuario.id
    redirect_to 'sessions/welcome'

    #respond_to do |format|
     # if 
      #  format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
       # format.json { render :show, status: :created, location: @usuario }
      #else
       # format.html { render :new }
        #format.json { render json: @usuario.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario_clase.update(usuario_clase_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario_clase.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def soaprotaciondetallada


    clase=params[:clase_btn]
    fecha=params[:fecha]
    

    client = Savon.client(wsdl: "http://192.168.13.17/asp/Service.asmx?WSDL")

    response = client.call(:monaco_detalle, message: {clase: clase , ano: fecha.first(4), mes: fecha.last(2)})
      if response.success?
        if !response.to_hash[:monaco_detalle_response][:monaco_detalle_result][:diffgram][:new_data_set].nil?
          @rotacion_detallada = response.to_hash[:monaco_detalle_response][:monaco_detalle_result][:diffgram][:new_data_set][:table]
        end
        #@rotacion_detallada = response.to_hash[:monaco_detalle_response][:monaco_detalle_result][:diffgram][:new_data_set][:table]
        #respond_to do |format|
        #format.html { redirect_to new_usuario_path(@nit_clase) , notice: 'Usuario was successfully destroyed.' }
        #format.html { redirect_to new_usuario_path , notice: 'Usuario was successfully destroyed.' }
            
        #end
      end

  end


  def lotesclase


    clase=params[:clase_btn]

    client = Savon.client(wsdl: "http://192.168.13.17/asp/Service.asmx?WSDL")

    response = client.call(:lotes_clase_monaco, message: {clase: clase})
      if response.success?
        if !response.to_hash[:lotes_clase_monaco_response][:lotes_clase_monaco_result][:diffgram][:new_data_set].nil?
          @lotes = response.to_hash[:lotes_clase_monaco_response][:lotes_clase_monaco_result][:diffgram][:new_data_set][:table]
        end
        #@rotacion_detallada = response.to_hash[:monaco_detalle_response][:monaco_detalle_result][:diffgram][:new_data_set][:table]
        #respond_to do |format|
        #format.html { redirect_to new_usuario_path(@nit_clase) , notice: 'Usuario was successfully destroyed.' }
        #format.html { redirect_to new_usuario_path , notice: 'Usuario was successfully destroyed.' }
            
        #end
      end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_clase
      @usuario_clase = UsuariosClase.find(params[:id])
    end

    protected
    # Use callbacks to share common setup or constraints between actions.
    def find_usuario_and_usuarios_clase
      @usuario = Usuario.find(current_user.id)
      @usuario_clase = UsuariosClase.find(params[:id]) if params[:id]
    end

    # Only allow a list of trusted parameters through.
    def usuario_clase_params
      params.require(:usuario_clase).permit(:clase, :descripcion_clase, :nit, :proveedor)
    end


end
