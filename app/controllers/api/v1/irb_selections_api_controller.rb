class Api::V1::IrbSelectionsApiController < ApiController
    before_action :set_irb_selection, only: [:show,:update]
    before_action :authenticate_user!

    def index
        @irb_selections = IrbSelection.all  
        @irb_selections_Pictures = IrbSelectionsPicture.all   
        picturePath = "public/assets/images/irbSelections/"
        render json:  @irb_selections.map{|u|             
            if @irb_selections_Pictures.exists?(:id => u.irb_selections_picture_id)  
                arrayImage = @irb_selections_Pictures.where(id: u.irb_selections_picture_id).to_a  
                imageFileName = arrayImage[0][:picture_file_name]      
                imageBase64 = Base64.encode64(File.read(picturePath+imageFileName.gsub(/\?.*+/,''))).gsub("\n",'')
            else
                imageBase64 = ""   
            end        
            u.attributes.merge(  
                #                    :imageBase64   => imageFileName
                :imageBase64 => imageBase64
                )}        
    end

    def show         
        render json: @irb_selection, include: ["three_offspring"]
    end 

    def update  
        if @irb_selection.update(irb_selection_params)
            render json: @irb_selection , status: 200
        else
            render json: { errors: @irb_selection.errors}, status: 422
        end
    end

    private
    def set_irb_selection
        @irb_selection = IrbSelection.find(params[:id])
    end

    def irb_selection_params
        params.require(:irb_selection).permit(:three_offspring_id, :code, :location, :trademark, :denomination, :year, :status, :numPlants, :color, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks, :irb_selections_picture_id,:likes)
    end

end
