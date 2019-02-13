class DiscsController < ApplicationController

    def create
        @disc = Disc.new(disc_params)
        @disc.save
    end

    def destroy
        @disc = Disc.find(params[:id])
        @disc.destroy
    end

    def update
    end

    private
        def disc_params
            params.require(:disc).permit(:type)
        end
end