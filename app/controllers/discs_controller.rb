class DiscsController < ApplicationController

    def create
        @disc = Disc.new(disc_params)
        @disc.save
        redirect_to new_cd_path
    end

    def destroy
        @disc = Disc.find(params[:id])
        @disc.destroy
    end

    def update
    end

    private
        def disc_params
            params.require(:disc).permit(:disc_number, :cd_id)
        end
end