class ConectiflorPicturesController < ApplicationController
    def create
        @conectiflor_selection = ConectiflorSelection.find(params[:conectiflor_selection_id])
        @picture = @conectiflor_selection.conectiflor_pictures.create(conectiflor_picture_params)
        #        redirect_to conectiflor_selection_path(@conectiflor_selection)

        if params[:conectiflor_picture]
            if @picture.save
                redirect_to conectiflor_selection_path(@conectiflor_selection), notice: 'Picture uploaded.'
            else
                @picture.errors.delete(:picture)
                render :new
            end
        else
            redirect_to conectiflor_selection_path(@conectiflor_selection), alert: 'Picture cannot be blank.'
        end
    end


    #Delete image
    def destroy
        @conectiflor_selection = ConectiflorSelection.find(params[:conectiflor_selection_id])        
        @picture = @conectiflor_selection.conectiflor_pictures.find(params[:id])
        @picture.destroy
        redirect_to conectiflor_selection_path(@conectiflor_selection), notice: 'Picture deleted'
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    #    private
    def conectiflor_picture_params
        params.require(:conectiflor_picture).permit(:picture) if params[:conectiflor_picture]
    end    
end