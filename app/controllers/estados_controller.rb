class EstadosController < ApplicationController

    def index
        @estados = Estado.all
    end
end