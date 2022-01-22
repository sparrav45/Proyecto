class ServiciosController < ApplicationController

  before_action :authorized, only: [:index,:edit, :update]
  attr_reader :a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l

  def index

  end

  def respuesta

    client = Savon.client(wsdl: "http://192.168.13.17/asp/Service.asmx?WSDL")

    response = client.call(:method1, message: {clase: "#{params[:clase]}"})
    #response = client.call(:method1, message: {clase: 4200})

    
    if response.success?

        @datos = response.to_hash[:method1_response][:method1_result][:diffgram][:new_data_set][:table]

      end

  end

end
