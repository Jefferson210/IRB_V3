class Api::V1::IrbSelectionsApiController < ApiController
    before_action :set_irb_selection, only: [:show]
    before_action :authenticate_user! 

    def index
        @irb_selections = IrbSelection.all                  
        render json:  @irb_selections, :methods => :mainPicture
    end

    def show          
        render json: @irb_selection, include: ["three_offspring"], :methods => :pictures     
    end 

    # def update  
    #     if @irb_selection.update(irb_selection_params)
    #         render json: @irb_selection , status: 200
    #     else
    #         render json: { errors: @irb_selection.errors}, status: 422
    #     end
    # end

    private
    def set_irb_selection
        @irb_selection = IrbSelection.find(params[:id])
    end

    def irb_selection_params
        params.require(:irb_selection).permit(:three_offspring_id, :code, :location, :trademark, :denomination, :year, :status, :numPlants, :color, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks, :irb_selections_picture_id,:likes)
    end

end
