class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    @user.address = Address.new
    super
  end

  def create
    super
      # super...親クラス（ここではdevise/users）を継承
      # deviseではresourceをuserオブジェクトの代わりとして使っている
      # devise がやってること
      # resource = User.new(user_params)
      # resource.save

      # 本来は以下と同じ
      # user = User.new(user_params)
      # user.save

    if resource.save
      @address = Address.new
        @address.user_id = resource.id
        @address.address_name = resource.name
        @address.address_namekana = resource.namekana
        @address.address_phone = resource.phone
        @address.address_postal = resource.postal
        @address.address_address = resource.address

      @address.save!
    end

  end

  private

    def address_params
      params.require(:user).permit(:name, :namekana, :phone, :postal, :address)
      # params.require(:user).permit(:address_name, :address_namekana, :address_phone, :address_postal, :address_address, :user_id)
    end

end

      # 別の記述
      # current_userはuserが作られた同じcreate actionの中では使えない
      # current_user.id
      # @address.address_name = params[:user][:name]
      # @address.address_namekana = params[:user][:namekana]
      # @address.address_phone = params[:user][:phone]
      # @address.address_postal = params[:user][:postal]
      # @address.address_address = params[:user][:address]