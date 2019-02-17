class LabelsController < ApplicationController

    def create
        @label = Label.new(label_params) unless @label
        @label.save
        redirect_to new_cd_path
    end

    private

    def label_params
        params.require(:label).permit(:company)
    end
end
