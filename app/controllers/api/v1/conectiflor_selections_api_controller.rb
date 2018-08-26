class Api::V1::ConectiflorSelectionsApiController < ApplicationController
    before_action :set_conectiflor_selection, only: [:show]

    def index
        #        @conectiflor_selections = ConectiflorSelection.all
        #        render json: @conectiflor_selections, include: ["color"]

        @conectiflor_selections = ConectiflorSelection.all  
        @conectiflor_selections_Pictures = ConectiflorPicture.all   
        picturePath = "public/assets/images/conectiflorSelections/"
        render json:  @conectiflor_selections.map{|u|             
            if @conectiflor_selections_Pictures.exists?(:id => u.conectiflor_picture_id)  
                arrayImage = @conectiflor_selections_Pictures.where(id: u.conectiflor_picture_id).to_a  
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
        render json: @conectiflor_selection, include: ["color"]
    end

    private
    def set_conectiflor_selection
        @conectiflor_selection = ConectiflorSelection.find(params[:id])
    end

    def conectiflor_selection_params        
        params.require(:conectiflor_selection).permit(:code, :location, :trademark, :denomination, :year, :status, :numPlants, :color_id, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks,:likes)
    end
end
