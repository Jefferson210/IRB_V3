class ThreeOffspringsController < ApplicationController
    before_action :set_three_offspring, only: [:show, :edit, :update, :destroy]

    # GET /three_offsprings
    # GET /three_offsprings.json
    def index
        @three_offsprings = ThreeOffspring.all
        @pictures = ThreeOffspringPicture.group(:three_offspring_id)
        @picturesParents = GeneticBankPicture.group(:genetic_bank_id)
        @threeOffsprings = initialize_grid(ThreeOffspring,
            include: [{two_offspring: :one_offspring}])
        @geneticBankImagesPath = "/assets/images/geneticBank/"
        @threeOffspringsImgPath = "/assets/images/threeOffspring/"
    end

    # GET /three_offsprings/1
    # GET /three_offsprings/1.json
    def show
    end

    def selectColor
        @objectTwoOffspring = TwoOffspring.find(params[:id])
        respond_to do |format|
            format.json {render :json => @objectTwoOffspring }
        end
    end

    # GET /three_offsprings/new
    def new
        @three_offspring = ThreeOffspring.new
    end

    # GET /three_offsprings/1/edit
    def edit
    end

    # POST /three_offsprings
    # POST /three_offsprings.json
    def create
        @three_offspring = ThreeOffspring.new(three_offspring_params)

        respond_to do |format|
            if @three_offspring.save
                format.html { redirect_to @three_offspring, notice: 'Three offspring was successfully created.' }
                format.json { render :show, status: :created, location: @three_offspring }
            else
                format.html { render :new }
                format.json { render json: @three_offspring.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /three_offsprings/1
    # PATCH/PUT /three_offsprings/1.json
    def update
        respond_to do |format|
            if @three_offspring.update(three_offspring_params)
                format.html { redirect_to @three_offspring, notice: 'Three offspring was successfully updated.' }
                format.json { render :show, status: :ok, location: @three_offspring }
            else
                format.html { render :edit }
                format.json { render json: @three_offspring.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /three_offsprings/1
    # DELETE /three_offsprings/1.json
    def destroy
        begin
            @three_offspring.destroy
            respond_to do |format|
                format.html { redirect_to three_offsprings_url, notice: 'Three offspring was successfully destroyed.' }
                format.json { head :no_content }
            end
        rescue ActiveRecord::DeleteRestrictionError => e
            respond_to do |format|
                format.html {redirect_to three_offsprings_url, alert: "#{e}"}
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_three_offspring
        @three_offspring = ThreeOffspring.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def three_offspring_params
        params.require(:three_offspring).permit(:two_offspring_id, :color, :status, :headSize, :flowering, :numPetals, :form)
    end
end
