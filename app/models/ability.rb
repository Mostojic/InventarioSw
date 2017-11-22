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
   can :cru, Usuario
   can :read, Pedido
   can :cru, Cliente
   
 elsif usuario.role == "usuario"
   alias_action :create, :read, :update, :edit, :delete, :destroy,:to => :cru
   can :cru, Item
   can :cru, Pedido
   can :cru, Elemento
   can :read, Hoja
   can :read, Insumo
   can :read, Producto
   can :read, Medida
   can :cru,  Cliente
  end
 end
end