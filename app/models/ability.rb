class Ability
  include CanCan::Ability

  def initialize(usuario)
 usuario ||= Usuario.new
 if usuario.role == "admin"
   alias_action :create, :read, :update, :edit, :delete, :destroy, :to => :cru
   can :cru, Medida
   can :cru, Insumo
   can :cru, Producto
   can :cru, Hoja
 elsif usuario.role == "user"
   alias_action :create, :read, :update, :edit, :delete, :destroy,:to => :cru
   can :cru, Item
   can :cru, Pedido
   can :cru, Elemento
   can :read, Hoja
   can :read, Insumo
   can :read, Producto
   can :read, Medida
  end
 end
end