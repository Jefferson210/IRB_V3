class GeneticBankPicturesController < ApplicationController
    def create
        @genetic_bank = GeneticBank.find(params[:genetic_bank_id])
        @picture = @genetic_bank.genetic_bank_pictures.create(genetic_bank_picture_params)
        #        redirect_to genetic_bank_path(@genetic_bank)

        if params[:genetic_bank_picture]
            if @picture.save
                redirect_to genetic_bank_path(@genetic_bank), notice: 'Picture uploaded.'
            else
                @picture.errors.delete(:picture)
                render :new
            end
        else
            redirect_to genetic_bank_path(@genetic_bank), alert: 'Picture cannot be blank.'
        end
    end

    def destroy
        @geneticBank = GeneticBank.find(params[:genetic_bank_id])
        @picture = @geneticBank.genetic_bank_pictures.find(params[:id])
        @picture.destroy
        redirect_to genetic_bank_path(@geneticBank), notice: "Picture Deleted"
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    #    private
    def genetic_bank_picture_params
        params.require(:genetic_bank_picture).permit(:picture) if params[:genetic_bank_picture]
    end
end
