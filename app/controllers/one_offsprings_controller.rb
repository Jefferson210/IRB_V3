class OneOffspringsController < ApplicationController
    before_action :set_one_offspring, only: [:show, :edit, :update, :destroy]

    # GET /one_offsprings
    # GET /one_offsprings.json
    def index
        @one_offsprings = OneOffspring.all
        @pictures = OneOffspringPicture.group(:one_offspring_id)
        @picturesParents = GeneticBankPicture.group(:genetic_bank_id)
        @oneOffsprings = initialize_grid(OneOffspring,
            include: [:color,:germination])
        @geneticBankImagesPath = "/assets/images/geneticBank/"
        @oneOffspringImgPath = "/assets/images/oneOffspring/"
    end

    # GET /one_offsprings/1
    # GET /one_offsprings/1.json
    def show
    end

    # GET /one_offsprings/new
    def new
        @one_offspring = OneOffspring.new
    end

    # GET /one_offsprings/1/edit
    def edit
    end

    # POST /one_offsprings
    # POST /one_offsprings.json
    def create
        @one_offspring = OneOffspring.new(one_offspring_params)

        respond_to do |format|
            if @one_offspring.save
                format.html { redirect_to @one_offspring, notice: 'One offspring was successfully created.' }
                format.json { render :show, status: :created, location: @one_offspring }
            else
                format.html { render :new }
                format.json { render json: @one_offspring.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /one_offsprings/1
    # PATCH/PUT /one_offsprings/1.json
    def update
        respond_to do |format|
            if @one_offspring.update(one_offspring_params)
                format.html { redirect_to @one_offspring, notice: 'One offspring was successfully updated.' }
                format.json { render :show, status: :ok, location: @one_offspring }
            else
                format.html { render :edit }
                format.json { render json: @one_offspring.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /one_offsprings/1
    # DELETE /one_offsprings/1.json
    def destroy
        begin
            @one_offspring.destroy
            respond_to do |format|
                format.html { redirect_to one_offsprings_url, notice: 'One offspring was successfully destroyed.' }
                format.json { head :no_content }
            end
        rescue ActiveRecord::DeleteRestrictionError => e
            respond_to do |format|
                format.html {redirect_to one_offsprings_url, alert: "#{e}"}
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_one_offspring
        @one_offspring = OneOffspring.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def one_offspring_params
        params.require(:one_offspring).permit(:germination_id, :individual, :color_id, :status, :headSize, :flowering, :numPetals, :form)
    end
end
