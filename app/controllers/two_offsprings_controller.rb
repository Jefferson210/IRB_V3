class TwoOffspringsController < ApplicationController
    before_action :set_two_offspring, only: [:show, :edit, :update, :destroy]

    # GET /two_offsprings
    # GET /two_offsprings.json
    def index
        @two_offsprings = TwoOffspring.all
        @pictures = TwoOffspringPicture.group(:two_offspring_id)
        @picturesParents = GeneticBankPicture.group(:genetic_bank_id)
        @twoOffsprings = initialize_grid(TwoOffspring,
            include: [{one_offspring: :germination}])
        @geneticBankImagesPath = "/assets/images/geneticBank/"
        @twoOffspringsImgPath = "/assets/images/twoOffspring/"      
    end

    # GET /two_offsprings/1
    # GET /two_offsprings/1.json
    def show
    end

    def selectColor
        @objectOneOffspring = OneOffspring.find(params[:id])
        @color = @objectOneOffspring.color
        respond_to do |format|
            format.json { render :json => @color }
        end
    end

    # GET /two_offsprings/new
    def new
        @two_offspring = TwoOffspring.new
    end

    # GET /two_offsprings/1/edit
    def edit
    end

    # POST /two_offsprings
    # POST /two_offsprings.json
    def create
        @two_offspring = TwoOffspring.new(two_offspring_params)

        respond_to do |format|
            if @two_offspring.save
                format.html { redirect_to @two_offspring, notice: 'Two offspring was successfully created.' }
                format.json { render :show, status: :created, location: @two_offspring }
            else
                format.html { render :new }
                format.json { render json: @two_offspring.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /two_offsprings/1
    # PATCH/PUT /two_offsprings/1.json
    def update
        respond_to do |format|
            if @two_offspring.update(two_offspring_params)
                format.html { redirect_to @two_offspring, notice: 'Two offspring was successfully updated.' }
                format.json { render :show, status: :ok, location: @two_offspring }
            else
                format.html { render :edit }
                format.json { render json: @two_offspring.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /two_offsprings/1
    # DELETE /two_offsprings/1.json
    def destroy
        begin
            @two_offspring.destroy
            respond_to do |format|
                format.html { redirect_to two_offsprings_url, notice: 'Two offspring was successfully destroyed.' }
                format.json { head :no_content }
            end
        rescue ActiveRecord::DeleteRestrictionError => e
            respond_to do |format|
                format.html {redirect_to two_offsprings_url, alert: "#{e}"}
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_two_offspring
        @two_offspring = TwoOffspring.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def two_offspring_params
        params.require(:two_offspring).permit(:one_offspring_id, :individual, :color, :status, :headSize, :flowering, :numPetals, :form)
    end
end
