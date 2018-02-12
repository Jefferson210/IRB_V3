class TwoOffspringPicturesController < ApplicationController
    def create
        @two_offspring = TwoOffspring.find(params[:two_offspring_id])
        @picture = @two_offspring.two_offspring_pictures.create(two_offspring_picture_params)
        #        redirect_to two_offspring_path(@two_offspring)

        if params[:two_offspring_picture]
            if @picture.save
                redirect_to two_offspring_path(@two_offspring), notice: 'Picture uploaded.'
            else
                @picture.errors.delete(:picture)
                render :new
            end
        else
            redirect_to two_offspring_path(@two_offspring), alert: 'Picture cannot be blank.'
        end
    end

    def destroy
        @twoOffspring = TwoOffspring.find(params[:two_offspring_id])
        @picture = @twoOffspring.two_offspring_pictures.find(params[:id])
        @picture.destroy
        redirect_to two_offspring_path(@twoOffspring), notice: "Picture Deleted"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #    private
    def two_offspring_picture_params
        params.require(:two_offspring_picture).permit(:picture) if params[:two_offspring_picture]
    end
end
