class Api::V1::GeneticBankPicturesApiController < ApiController
    before_action :set_genetic_bank_pictures, only: [:show]
#    before_action :authenticate_user!

    def index
        @geneticBankPictures = GeneticBankPicture.all        
        render json:  @geneticBankPictures.map{|u| 
                u.attributes.merge(:thumbnail_url => u.picture.url,
                    :base64 => Base64.encode64(File.read("public"+u.picture.url.gsub(/\?.*+/,''))).gsub("\n",''))}
    end

    def show         
        render json: @geneticBankPicture
    end 

    private
    def set_genetic_bank_pictures
        @geneticBankPicture = GeneticBankPicture.find(params[:id])
    end

    def genetic_bank_picture_params
        params.require(:genetic_bank_picture).permit(:picture) if params[:genetic_bank_picture]
    end
end
