class Api::V1::SpekSelectionsApiController < ApplicationController
    before_action :set_spek_selection, only: [:show]
    before_action :authenticate_user!

    def index
        @spek_selections = SpekSelection.all  
        @spekSelectionsPictures = SpekSelectionsPicture.all   
        picturePath = "public/assets/images/spekSelections/"
        render json:  @spek_selections.map{|u|             
            if @spekSelectionsPictures.exists?(:id => u.spek_selections_picture_id)  
                arrayImage = @spekSelectionsPictures.where(id: u.spek_selections_picture_id).to_a  
                imageFileName = arrayImage[0][:picture_file_name]      
                imageBase64 = Base64.encode64(File.read(picturePath+imageFileName.gsub(/\?.*+/,''))).gsub("\n",'')
            else
                imageBase64 = ""   
            end        
            u.attributes.merge(  
                #                    :imageBase64   => imageFileName
                :imageBase64 => imageBase64,
                :color => Color.where(:id => u.color_id)
                )} 
    end

    def show
        render json: @spek_selection, include: ["color"]
    end

    private
    def set_spek_selection
        @spek_selection = SpekSelection.find(params[:id])
    end

    def spek_selection_params
        params.require(:spek_selection).permit(:code, :location, :trademark, :denomination, :year, :status, :numPlants, :color_id, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks,:likes)
    end
end
