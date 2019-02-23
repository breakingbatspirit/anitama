class AddressesController < ApplicationController

	before_action :configure_permitted_parameters, if: :devise_controller?

    def new
        @address = Address.new
    end

    def create
        @address = Address.new(address_params)
        @address.user_id = current_user.id
        if @address.save
            redirect_to purchase_path
        else
            @address = Address.new(address_params)
            redirect_to purchase_path
        end
    end

    private
        def address_params
            params.require(:address).permit(:address_name, :address_namekana, :address_postal, :address_address, :address_phone, :user_id)
        end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

