class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :get_cart

  protected

  def get_cart
    if user_signed_in?
      @cart = Cart.find_or_create_by(user_id: current_user.id, billed: false)
      if @cart.nil?
        @cart = user.carts.create
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def only_admin
    unless user_signed_in? && current_user.role == "admin"
      redirect_to root_path, notice: "No tienes permiso para realizar esta acción"
    end
  end
  
end
