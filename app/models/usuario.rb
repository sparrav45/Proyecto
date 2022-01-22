class Usuario < ApplicationRecord

    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    has_many :usuarios_clases
    has_many :documentos_pedidos
    
    
    accepts_nested_attributes_for :usuarios_clases, reject_if: proc { |attributes| attributes['clase'].blank? }

    def self.search(search)
        if search
          #where('name LIKE ?', "%#{search}%")
            #(:conditions => ['tercero LIKE ? OR clase LIKE ?', "%#{search}%", "%#{search}%"])
            where("cedula LIKE ? OR nombre LIKE ? OR apellido LIKE ? OR email LIKE ?",  "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
            #where(tercero: "%#{search}%").or(clase: "%#{search}%")
            #where(category: "Programming").or((category: "Ruby"))

        else
           all
        end
    end

end
