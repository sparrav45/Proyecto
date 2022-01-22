class DocumentosPedidosController < ApplicationController

  before_action :authorized, only: [:index,:edit, :update]
  before_action :set_documentos_pedido, only: [:show, :edit, :update, :destroy]

  # GET /documentos_pedidos
  # GET /documentos_pedidos.json
  def index
    if current_user.rol_id == 1
      #documentos_pedidos = DocumentosPedido.all
      @documentos_pedidos = DocumentosPedido.search(params[:search]).order(created_at: :desc).paginate :page => params[:page],:per_page => 50
      #@products = Product.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
    elsif current_user.rol_id == 2
      #@maquinas = maquinas.paginate :page => params[:page], :order =>'ref',:per_page => 20
      documentos_pedidos = DocumentosPedido.where usuario_id: current_user.id
      @documentos_pedidos = documentos_pedidos.search(params[:search]).order(created_at: :desc).paginate :page => params[:page],:per_page => 50


    end
  end

  # GET /documentos_pedidos/1
  # GET /documentos_pedidos/1.json
  def show

  end

  # GET /documentos_pedidos/new
  def new

    @usuarios_clases = UsuariosClase.where(usuario_id: current_user.id,clase: params[:clase])


    if @usuarios_clases.nil?

    else

      @documentos_pedido = DocumentosPedido.new

      clase=params[:clase]
      
      #@usuarios_clases.each do |usuarios_clase|
        client = Savon.client(wsdl: "http://192.168.13.17/asp/Service.asmx?WSDL")
        response = client.call(:method1, message: {clase: clase})
  
        if response.success?
          if !response.to_hash[:method1_response][:method1_result][:diffgram][:new_data_set].nil?
              @datos = response.to_hash[:method1_response][:method1_result][:diffgram][:new_data_set][:table]
          end
        end  
      end

      @documentos_pedido.documentos_lin_pedidos.build

      #respond_to do |format|
       # format.js
       # format.html
      #end
    #end
  end


  # GET /documentos_pedidos/1/edit
  def edit

  end

  # POST /documentos_pedidos
  # POST /documentos_pedidos.jso

  def create

    #@documentos_pedido = DocumentosPedido.new
    @documentos_pedido = DocumentosPedido.new(documentos_pedido_params)
    

    #if @documentos_pedido.documentos_pedido_params.nil?==false
    respond_to do |format|
      
      if @documentos_pedido.save
        format.html { redirect_to @documentos_pedido, notice: 'Documentos pedido was successfully created.' }
        #format.html { redirect_to usuario_documentos_pedidos_path(current_user.id), notice: 'Documentos pedido was successfully created.'}
        format.json { render :show, status: :created, location: @documentos_pedido }
      else
        #format.html { redirect_to usuario_documentos_pedidos_path(current_user.id), notice: 'Documentos pedido Error en la creacion del documento.'}
        format.html { render :new }
        format.json { render json: @documentos_pedido.errors, status: :unprocessable_entity }
      #end
      end
    end
  end

  # PATCH/PUT /documentos_pedidos/1
  # PATCH/PUT /documentos_pedidos/1.json
  def update
    respond_to do |format|
      if @documentos_pedido.update(documentos_pedido_params)
        format.html { redirect_to @documentos_pedido, notice: 'Documentos lin pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @documentos_pedido }
      else
        format.html { render :edit }
        format.json { render json: @documentos_pedido.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /documentos_pedidos/1
  # DELETE /documentos_pedidos/1.json
  def destroy
    @documentos_pedido.destroy
    respond_to do |format|
      format.html { redirect_to documentos_pedidos_url, notice: 'Documentos pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documentos_pedido
      @documentos_pedido = DocumentosPedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.

    def documentos_pedido_params
      #codigo original
      #params.require(:documentos_pedido).permit(:nit, :tercero, :id_clase, :clase, :iva, :valor_total)      
      params.require(:documentos_pedido).permit(:nit, :tercero, :id_clase, :clase, :iva, :valor_total,:usuario_id,:estado_id, documentos_lin_pedidos_attributes:[:codigo, :descripcion, :costo_unitario, :cantidad])
      
      

    end

    

end
