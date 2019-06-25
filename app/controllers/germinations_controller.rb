class GerminationsController < ApplicationController
    before_action :set_germination, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    # GET /germinations
    # GET /germinations.json
    def index
        @germinations = Germination.all
        #Para traer todas las imagenes
        @pictures = GeneticBankPicture.group(:genetic_bank_id)        
        @germinationsGrid = initialize_grid(Germination,
            include: [:seed])
        @geneticBankImagesPath = "/assets/images/geneticBank/"
    end

    # GET /germinations/1
    # GET /germinations/1.json
    def show
        @pictures = GeneticBankPicture.group(:genetic_bank_id)        
    end

    def numGerminationsNumRepeat
        @numRepeat = Germination.group(:codeCrossNumRepeat).sum(:numGerminations)

        respond_to do |format|
            format.json { render :json => @numRepeat }
        end
    end

    def numGerminationsCodeCross
        #@Code = Germination.group(:codeCross).sum(:numGerminations)  
        @Code = Germination.group(:codeCrossNumRepeat).sum(:numGerminations)  
        @missinSeeds = Germination.group(:codeCross).maximum(:missingSeed)
        @totalSeeds = Seed.group(:codeCross).maximum(:totalCode)
        @totalSeedsNumRepeat = Seed.group(:codeCrossName).maximum(:totalNumRepeat) 
        @CodeAndMissingSeed = []
        @CodeAndMissingSeed<<@Code
        @CodeAndMissingSeed<<@missinSeeds
        @CodeAndMissingSeed<<@totalSeeds
        @CodeAndMissingSeed<<@totalSeedsNumRepeat

        respond_to do |format|
            format.json { render :json => @CodeAndMissingSeed }
        end
    end

    # GET /germinations/new
    def new
        @germination = Germination.new
    end

    # GET /germinations/1/edit
    def edit
    end

    # POST /germinations
    # POST /germinations.json
    def create
        @germination = Germination.new(germination_params)

        respond_to do |format|
            if @germination.save
                format.html { redirect_to @germination, notice: 'Germination was successfully created.' }
                format.json { render :show, status: :created, location: @germination }
                format.js
            else
                format.html { render :new }
                format.json { render json: @germination.errors, status: :unprocessable_entity }
                format.js
            end
        end
    end

    # PATCH/PUT /germinations/1
    # PATCH/PUT /germinations/1.json
    def update
        respond_to do |format|
            if @germination.update(germination_params)
                format.html { redirect_to @germination, notice: 'Germination was successfully updated.' }
                format.json { render :show, status: :ok, location: @germination }
                format.js
            else
                format.html { render :edit }
                format.json { render json: @germination.errors, status: :unprocessable_entity }
                format.js
            end
        end
    end

    # DELETE /germinations/1
    # DELETE /germinations/1.json
    def destroy
        begin
            @germination.destroy
            respond_to do |format|
                format.html { redirect_to germinations_url, notice: 'Germination was successfully destroyed.' }
                format.json { head :no_content }
                format.js
            end
        rescue ActiveRecord::DeleteRestrictionError => e
            sweetalert_error("
            Cannot delete record because of dependent One offsprings", 'Error', persistent: 'Ok!')   
            respond_to do |format|
                format.html { redirect_to germinations_url}      
            end
        end
    end

    def getSumByCodeCross
        @CodeCross = Germination.group(:codeCross).sum(:numGerminations)    
        @numSeedsNumRepeat = Seed.group(:codeCross).sum(:numSeeds)
        
        @getCrossing = []
        @getCrossing<<@CodeCross
        @getCrossing<<@numSeedsNumRepeat

        respond_to do |format|
            format.json { render :json => @getCrossing }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_germination
        @germination = Germination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def germination_params
        params.require(:germination).permit(:seed_id, :week, :numGerminations,:codeCross, :codeCrossNumRepeat, :totalNumRepeat, :totalCode, :missingSeed)
    end

    helper_method :sumaCodeCrossNumRepeat
    def sumaCodeCrossNumRepeat
        @CodeCross = Germination.group(:codeCrossNumRepeat).sum(:numGerminations) 
    end

    # helper_method :sumaCodeCross
    # def sumaCodeCross
    #     @CodeCross = Germination.group(:codeCross).sum(:numGerminations)    
    # end

    helper_method :percentajeSeedsNumRepeat
    def percentajeSeedsNumRepeat    
        @numSeedsNumRepeat = Seed.group(:codeCrossName).sum(:numSeeds)
    end

    helper_method :percentajeSeedscodeCross
    def percentajeSeedscodeCross    
        @numSeedsNumRepeat = Seed.group(:codeCross).sum(:numSeeds)
    end

end
