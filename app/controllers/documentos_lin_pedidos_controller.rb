class DocumentosLinPedidosController < ApplicationController

  before_action :authorized, only: [:index,:edit, :update]
  before_action :set_documentos_lin_pedido, only: [:show, :edit, :update, :destroy]
  before_action :find_documentos_pedido_and_documentos_lin_pedido

  # GET /documentos_lin_pedidos
  # GET /documentos_lin_pedidos.json
  def index
        @documentos_lin_pedidos = @documentos_pedido.documentos_lin_pedidos.all

        respond_to do |format|
          format.html
          format.csv { send_data @documentos_lin_pedidos.to_csv}
        end
  end

  # GET /documentos_lin_pedidos/1
  # GET /documentos_lin_pedidos/1.json
  def show

  end


  # GET /documentos_lin_pedidos/new
  def new
    @documentos_lin_pedido = DocumentosLinPedido.new
  end

  # GET /documentos_lin_pedidos/1/edit
  def edit
    @documentos_lin_pedido = DocumentosLinPedido.find(params[:id])
  end

  # POST /documentos_lin_pedidos
  # POST /documentos_lin_pedidos.jso

  def create

  
    @documentos_lin_pedido = DocumentosLinPedido.new(documentos_lin_pedido_params)
    #@documentos_lin_pedido.documentos_pedido_id = @documentos_pedido.id

    respond_to do |format|
      if @documentos_lin_pedido.save
        format.html { redirect_to @documentos_lin_pedido, notice: 'Documentos lin pedido was successfully created.' }
        format.json { render :show, status: :created, location: @documentos_lin_pedido }
      else
        format.html { render :new }
        format.json { render json: @documentos_lin_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # PATCH/PUT /documentos_lin_pedidos/1
  # PATCH/PUT /documentos_lin_pedidos/1.json
  def update
    respond_to do |format|
      if @documentos_lin_pedido.update(documentos_lin_pedido_params)
        #format.html { redirect_to @documentos_lin_pedido, notice: 'Documentos lin pedido was successfully updated.' }
        format.html { redirect_to documentos_pedido_documentos_lin_pedidos_path, notice: 'Documentos lin pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @documentos_lin_pedido }
      else
        format.html { render :edit }
        format.json { render json: @documentos_lin_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos_lin_pedidos/1
  # DELETE /documentos_lin_pedidos/1.json
  def destroy
    @documentos_lin_pedido.destroy
    respond_to do |format|
      format.html { redirect_to documentos_lin_pedidos_url, notice: 'Documentos lin pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documentos_lin_pedido
      @documentos_lin_pedido = DocumentosLinPedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documentos_lin_pedido_params
      #codigo original
      params.require(:documentos_lin_pedido).permit(:codigo, :descripcion, :costo_unitario, :cantidad)
      #params.require(:documentos_lin_pedido).permit(:codigo, :descripcion, :costo_unitario, :cantidad)      
    end

    protected  
    
    def find_documentos_pedido_and_documentos_lin_pedido
      @documentos_pedido = DocumentosPedido.find(params[:documentos_pedido_id])
      @documentos_lin_pedido = DocumentosLinPedido.find(params[:id]) if params[:id]  end

end
