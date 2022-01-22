class DocumentosPedido < ApplicationRecord

    has_many :documentos_lin_pedidos
    belongs_to :usuario
    

    accepts_nested_attributes_for :documentos_lin_pedidos, reject_if: proc { |attributes| attributes['cantidad'].blank? }

    def self.search(search)
        if search
            where("tercero LIKE ? OR clase LIKE ?",  "%#{search}%", "%#{search}%")
        else
           all
        end
    end
    
end
