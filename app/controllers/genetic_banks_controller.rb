class GeneticBanksController < ApplicationController
    before_action :set_genetic_bank, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def generateBarCode
        @barcode = Hash.new
        @codeGeneticBanks = params[:geneticBank]
        if @codeGeneticBanks != nil
            @codeGeneticBanks.each do |geneticBankId|
                if geneticBankId != "multiselect-all"
                    @geneticBank = GeneticBank.find(geneticBankId)
                    @barcode[@geneticBank.code] = barcodeOutPut(@geneticBank); 
                end
            end
        end
        respondToPDF("GeneticBank")  
    end

    # GET /genetic_banks
    # GET /genetic_banks.json
    def index
        @genetic_banks = GeneticBank.all.order(created_at: :desc)
        @pictures = GeneticBankPicture.group(:genetic_bank_id)
        @geneticBank = initialize_grid(GeneticBank,
            include: [:color],
            order: 'created_at',
            order_direction: 'desc')                       
        @geneticBankImagesPath = "/assets/images/geneticBank/"

    end

    # GET /genetic_banks/1
    # GET /genetic_banks/1.json
    def show
    end

    # GET /genetic_banks/new
    def new
        @genetic_bank = GeneticBank.new
    end

    # GET /genetic_banks/1/edit
    def edit
    end

    # POST /genetic_banks
    # POST /genetic_banks.json   
    def create
        @genetic_bank = GeneticBank.new(genetic_bank_params)            
        respond_to do |format|
          if @genetic_bank.save    
            if params[:images]              
              params[:images].each { |image|
                @genetic_bank.genetic_bank_pictures.create(picture: image)
              }
            end    
            format.html { redirect_to @genetic_bank} 
            format.json { render json: @genetic_bank, status: :created, location: @genetic_bank }
            format.js  
          else
            format.html { render action: "new" }
            format.json { render json: @genetic_bank.errors, status: :unprocessable_entity }
            format.js  
          end
        end
    end

    # PATCH/PUT /genetic_banks/1
    # PATCH/PUT /genetic_banks/1.json    
    def update       
        respond_to do |format|
          if @genetic_bank.update_attributes(genetic_bank_params)
            if params[:images]              
              params[:images].each { |image|                
                @genetic_bank.genetic_bank_pictures.create(picture: image)                                
              }
            end            
            format.html { redirect_to @genetic_bank, notice: 'Genetic bank was successfully updated.' }
            format.json { render json: {                       
                        :message => 'Genetic bank was successfully updated.'
                    }
                }             
            format.js
          else
            format.html { render :edit }
            format.json { render json: @genetic_bank.errors, status: :unprocessable_entity }
            format.js
          end
        end       
      end


    # DELETE /genetic_banks/1
    # DELETE /genetic_banks/1.json
    def destroy        
        begin
            @genetic_bank.destroy
            sweetalert_success('', 'Deleted', persistent: 'Ok!')
            respond_to do |format|
                format.html {redirect_to genetic_banks_url}
                format.json {head :no_content}
                format.js
            end
        rescue ActiveRecord::DeleteRestrictionError => e 
            sweetalert_error('Cannot delete the record because it is a parent in a crossing.', 'Error', persistent: 'Ok!')
            respond_to do |format|
                format.html {redirect_to genetic_banks_url}                
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_genetic_bank
        @genetic_bank = GeneticBank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genetic_bank_params
        params.require(:genetic_bank).permit(:code, :location, :trademark, :denomination, :year, :breeder, :status, :numPlants, :color_id, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks, :PictureId)
    end
end

