class UsuariosController < ApplicationController
  
  before_action :authorized, only: [:index,:edit, :update]
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]


  # GET /usuarios
  # GET /usuarios.json
  def index

    if current_user.rol_id == 1
        #@usuarios = Usuario.all
        @usuarios = Usuario.search(params[:search]).paginate :page => params[:page],:per_page => 50
        #@usuarios_clases = @usuario.usuarios_clases.all
    else
      redirect_to usuario_usuarios_clases_path(current_user.id)
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    
  end

  # GET /usuarios/new
  def new

    @usuario = Usuario.new

    @nit=params[:nit]
    if @nit.empty? == false
      client = Savon.client(wsdl: "http://192.168.13.17/asp/Service.asmx?WSDL")
    
      response = client.call(:nit_clase_monaco, message: {nit: @nit})
    
      if response.success?
        if !response.to_hash[:nit_clase_monaco_response][:nit_clase_monaco_result][:diffgram][:new_data_set].nil?
          @nit_clase = response.to_hash[:nit_clase_monaco_response][:nit_clase_monaco_result][:diffgram][:new_data_set][:table]
        end
      end
    end
      @usuario.usuarios_clases.build
      
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create

    @usuario = Usuario.new(usuario_params)

    @usuario.save
    
    respond_to do |format|
      if 
        session[:user_id]=@usuario.id
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
    
  #end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
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
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    def registro

    end


    def rotaciondetallada

      if current_user.rol_id == 1
        #@usuarios_clases = UsuariosClase.all
        @usuarios_clases = @usuario.usuarios_clases.all
      elsif current_user.rol_id == 2
        @usuarios_clases = UsuariosClase.where usuario_id: current_user.id
        #@usuarios_clases = @usuario.usuarios_clases.all
      end
  
      # #if @nit.empty? == false
      #   client = Savon.client(wsdl: "http://192.168.13.17/asp/Service.asmx?WSDL")
      
      #   response = client.call(:monaco_detalle, message: {clase: 4090 , ano: 2021, mes: 10})
      
      #   if response.success?
      #     if !response.to_hash[:monaco_detalle_response][:monaco_detalle_result][:diffgram][:new_data_set].nil?
      #       @rotacion_detallas = response.to_hash[:monaco_detalle_response][:monaco_detalle_result][:diffgram][:new_data_set][:table]
      #     end
      #   end
      # #end

    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      #params.require(:usuario).permit(:cedula, :nombre, :apellido, :email)
      
      params.require(:usuario).permit(:cedula, :nombre, :apellido, :email,:password,:rol_id,usuarios_clases_attributes:[:clase, :descripcion_clase, :nit, :proveedor])
      
    end

end
