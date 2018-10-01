class ThreeOffspringPicturesController < ApplicationController
    def create
        @three_offspring = ThreeOffspring.find(params[:three_offspring_id])
        @picture = @three_offspring.three_offspring_pictures.create(three_offspring_picture_params)
        #        redirect_to three_offspring_path(@three_offspring)

        if params[:three_offspring_picture]
            if @picture.save
                redirect_to three_offspring_path(@three_offspring), notice: 'Picture uploaded.'
            else
                @picture.errors.delete(:picture)
                render :new
            end
        else
            redirect_to three_offspring_path(@three_offspring), alert: 'Picture cannot be blank.'
        end
    end

    def destroy
        @threeOffspring = ThreeOffspring.find(params[:three_offspring_id])
        @picture = @threeOffspring.three_offspring_pictures.find(params[:id])
        if @picture.id == @threeOffspring.PictureId
            redirect_to three_offspring_path(@threeOffspring), :flash => {:error => "The image is selected as the main image and can not be deleted.Change the image in the 'edit' option"}    
        else
            @picture.destroy
            redirect_to three_offspring_path(@threeOffspring), notice: "Picture Deleted"
        end           
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #    private
    def three_offspring_picture_params
        params.require(:three_offspring_picture).permit(:picture) if params[:three_offspring_picture]
    end
end
