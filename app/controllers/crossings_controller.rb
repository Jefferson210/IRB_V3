class CrossingsController < ApplicationController
    before_action :set_crossing, only: [:show, :edit, :update, :destroy]

    # GET /crossings
    # GET /crossings.json
    def index
        @crossings = Crossing.all
        #Para traer todas las imagenes
        @pictures = GeneticBankPicture.group(:genetic_bank_id)
        @crossingsGrid = initialize_grid(Crossing,
            include: [:father,:mother])
        @geneticBankImagesPath = "/assets/images/geneticBank/"
    end

    # GET /crossings/1
    # GET /crossings/1.json
    def show
    end

    def getCrossing
        @objectCrossing = Crossing.find(params[:id])
        @CodeCross = Seed.group(:codeCross).sum(:numSeeds)  
        @getCrossing = []
        @getCrossing<<@CodeCross
        @getCrossing<<@objectCrossing

        respond_to do |format|
            format.json { render :json => @getCrossing }
        end
    end

    def codeCrossParents
        #        @parents = Crossing.where(:codeCross => params[:text]).first
        #        respond_to do |format|
        #            format.json { render :json => @parents }
        #        end

        @parents = Crossing.where(:codeCross => params[:text]).first
        @fatherId = @parents.father_id
        puts "Id padre @fatherId #{@fatherId}"
        @geneticBankFather = GeneticBank.where(:id => @fatherId)        
        puts @geneticBankFather
        respond_to do |format|
            format.json { render :json => @geneticBankFather}
        end
    end

    def validRepetition
        @infor=params[:info].split('-')
        @code=@infor[0]
        @numRepetition=@infor[1]

        @CrossingExist = Crossing.where(codeCross:@code,numRepeat:@numRepetition)


        respond_to do |format|
            format.json { render :json => @CrossingExist }
        end

    end

    def getCrossingsByYear
        @year=params[:year]
        @Crossings=Crossing.where(year:@year,status:'Keep')
        respond_to do |format|
            format.json { render :json => @Crossings }
        end

    end

    # GET /crossings/new
    def new
        @crossing = Crossing.new
    end

    # GET /crossings/1/edit
    def edit
    end

    # POST /crossings
    # POST /crossings.json
    def create
        @crossing = Crossing.new(crossing_params)

        respond_to do |format|
            if @crossing.save
                format.html { redirect_to @crossing, notice: 'Crossing was successfully created.' }
                format.json { render :show, status: :created, location: @crossing }
            else
                format.html { render :new }
                format.json { render json: @crossing.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /crossings/1
    # PATCH/PUT /crossings/1.json
    def update
        respond_to do |format|
            if @crossing.update(crossing_params)
                format.html { redirect_to @crossing, notice: 'Crossing was successfully updated.' }
                format.json { render :show, status: :ok, location: @crossing }
            else
                format.html { render :edit }
                format.json { render json: @crossing.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /crossings/1
    # DELETE /crossings/1.json
    def destroy
        begin
            @crossing.destroy
            respond_to do |format|
                format.html {redirect_to crossings_url, :flash =>{:success => 'Crossing was successfully destroyed.'}}
                format.json {head :no_content}
            end
        rescue StandardError => e 
            #        rescue ActiveRecord::DeleteRestrictionError => e 
            respond_to do |format|
                format.html {redirect_to crossings_url, alert: "Cannot delete record because of dependent seeds"}
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_crossing
        @crossing = Crossing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crossing_params
        params.require(:crossing).permit(:codeCross, :numOrder, :year, :status, :father_id, :mother_id, :crossWeek, :numCrossings, :goodCrossings, :badCrossings, :effective, :percentageEffective, :dateHarvest, :weekHarvest, :numSeeds, :numRepeat)
    end
end
