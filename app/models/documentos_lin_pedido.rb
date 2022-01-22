class DocumentosLinPedido < ApplicationRecord

    belongs_to :documentos_pedido


    def self.to_csv
        CSV.generate do |csv| 
            csv << column_names
            all.each do |documentos_lin_pedido|
                csv << documentos_lin_pedido.attributes.values_at(*column_names)
            end
        end
    end

end
