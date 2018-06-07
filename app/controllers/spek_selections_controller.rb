class SpekSelectionsController < ApplicationController
    before_action :set_spek_selection, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    # GET /spek_selections
    # GET /spek_selections.json
    def index
        @spek_selections = SpekSelection.all
        @pictures = SpekSelectionsPicture.group(:spek_selection_id)
        @spekSelectionsGrid = initialize_grid(SpekSelection,
            include:[:color])
        #                        group: ['spek_selections.code'])
        @spekImagesPath = "/assets/images/spekSelections/"
    end

    # GET /spek_selections/1
    # GET /spek_selections/1.json
    def show
    end

    # GET /spek_selections/new
    def new
        @spek_selection = SpekSelection.new
    end

    # GET /spek_selections/1/edit
    def edit
    end

    # POST /spek_selections
    # POST /spek_selections.json
    def create
        @spek_selection = SpekSelection.new(spek_selection_params)

        respond_to do |format|
            if @spek_selection.save
                format.html { redirect_to @spek_selection, notice: 'Spek selection was successfully created.' }
                format.json { render :show, status: :created, location: @spek_selection }
            else
                format.html { render :new }
                format.json { render json: @spek_selection.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /spek_selections/1
    # PATCH/PUT /spek_selections/1.json
    def update
        respond_to do |format|
            if @spek_selection.update(spek_selection_params)
                format.html { redirect_to @spek_selection, notice: 'Spek selection was successfully updated.' }
                format.json { render :show, status: :ok, location: @spek_selection }
            else
                format.html { render :edit }
                format.json { render json: @spek_selection.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /spek_selections/1
    # DELETE /spek_selections/1.json
    def destroy
        @spek_selection.destroy
        respond_to do |format|
            format.html { redirect_to spek_selections_url, notice: 'Spek selection was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_spek_selection
        @spek_selection = SpekSelection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spek_selection_params
        params.require(:spek_selection).permit(:code, :location, :trademark, :denomination, :year, :status, :numPlants, :color_id, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks)
    end
end
