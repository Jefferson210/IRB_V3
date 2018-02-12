class SpekSelectionsPicturesController < ApplicationController
    def create
        @spek_selection = SpekSelection.find(params[:spek_selection_id])
        @picture = @spek_selection.spek_selections_pictures.create(spek_selections_picture_params)
        #        redirect_to spek_selection_path(@spek_selection)

        if params[:spek_selections_picture]
            if @picture.save
                redirect_to spek_selection_path(@spek_selection), notice: 'Picture uploaded.'
            else
                @picture.errors.delete(:picture)
                render :new
            end
        else
            redirect_to spek_selection_path(@spek_selection), alert: 'Picture cannot be blank.'
        end
    end


    #Delete image
    def destroy
        @spek_selection = SpekSelection.find(params[:spek_selection_id])        
        @picture = @spek_selection.spek_selections_pictures.find(params[:id])
        @picture.destroy
        redirect_to spek_selection_path(@spek_selection), notice: 'Picture deleted'
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    #    private
    def spek_selections_picture_params
        params.require(:spek_selections_picture).permit(:picture) if params[:spek_selections_picture]
    end
end
