class Api::V1::ConectiflorSelectionsApiController < ApplicationController
    before_action :set_conectiflor_selection, only: [:show]

    def index      
        @conectiflor_selections = ConectiflorSelection.all  
        render json:  @conectiflor_selections, :methods => :mainPicture
    end

    def show
        render json: @conectiflor_selection, include: ["color"], :methods => :pictures     
    end

    private
    def set_conectiflor_selection
        @conectiflor_selection = ConectiflorSelection.find(params[:id])
    end

    def conectiflor_selection_params        
        params.require(:conectiflor_selection).permit(:code, :location, :trademark, :denomination, :year, :status, :numPlants, :color_id, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks,:likes)
    end
end
