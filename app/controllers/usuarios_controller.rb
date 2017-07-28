class UsuariosController < ApplicationController
	before_action :validate_user
  def index
  	@usuarios = Usuario.all.order("email").paginate(page: params[:page],per_page:10)
  end

  def show
    @usuario = Usuario.find(params[:id])
    if @usuario.role=="user"
      Usuario.update(@usuario.id, :role => 'usuario')
    end
    redirect_to usuarios_path
  end

  def edit
    @usuario = Usuario.find(params[:id])
    if @usuario.role=="usuario"
      Usuario.update(@usuario.id, :role => 'user')
    end
    redirect_to usuarios_path
  end

  def destroy 
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    redirect_to usuarios_path
  end

  	private
  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end
