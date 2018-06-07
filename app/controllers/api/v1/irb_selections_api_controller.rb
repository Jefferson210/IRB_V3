class Api::V1::IrbSelectionsApiController < ApiController
    before_action :set_irb_selection, only: [:show]
    before_action :authenticate_user!

    def index
        @irb_selections = IrbSelection.all
        render json:  @irb_selections, include: ["three_offspring"]
    end

    def show         
        render json: @irb_selection, include: ["three_offspring"]
    end 

    private
    def set_irb_selection
        @irb_selection = IrbSelection.find(params[:id])
    end

    def irb_selection_params
        params.require(:irb_selection).permit(:three_offspring_id, :code, :location, :trademark, :denomination, :year, :status, :numPlants, :color, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks)
    end
end
