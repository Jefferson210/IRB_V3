class Api::V1::SpekSelectionsApiController < ApplicationController
    before_action :set_spek_selection, only: [:show]

    def index
        @spek_selections = SpekSelection.all
        render json:  @spek_selections , include: ["color"]
    end

    def show
        render json: @spek_selection, include: ["color"]
    end
    
    private
    def set_spek_selection
        @spek_selection = SpekSelection.find(params[:id])
    end

    def spek_selection_params
        params.require(:spek_selection).permit(:code, :location, :trademark, :denomination, :year, :status, :numPlants, :color_id, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks)
    end
end
