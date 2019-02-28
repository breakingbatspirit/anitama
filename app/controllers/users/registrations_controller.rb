class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    @user.address = Address.new
    super
  end

  def create
    # super...親クラス（ここではdevise/users）を継承
    super
      @address = Address.new(address_params)
      @address.user_id = current_user.id
      # puts "aaaaaaaaaaaaaaaaaaa"
      # puts params[:user][:address]
      @address.address_name = params[:user][:name]
      @address.address_namekana = params[:user][:namekana]
      @address.address_phone = params[:user][:phone]
      @address.address_postal = params[:user][:postal]
      @address.address_address = params[:user][:address]
      binding.pry
    if @address.save
      redirect_to root_path
    else
      binding.pry
      p @address.errors.full_messages
    end
  end

  private

    def address_params
      # params.require(:address).permit(:name, :namekana, :phone, :postal, :address)
      params.require(:user).permit(:address_name, :address_namekana, :address_phone, :address_postal, :address_address, :user_id)
    end

end