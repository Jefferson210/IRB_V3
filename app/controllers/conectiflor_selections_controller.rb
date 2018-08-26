class ConectiflorSelectionsController < ApplicationController
    before_action :set_conectiflor_selection, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    # GET /conectiflor_selections
    # GET /conectiflor_selections.json
    def index
        @conectiflor_selections = ConectiflorSelection.all
        @pictures = ConectiflorPicture.all
        @conectiflorSelectionsGrid = initialize_grid(ConectiflorSelection,
            include:[:color])
        #                        group: ['spek_selections.code'])
        @conectiflorImagesPath = "/assets/images/conectiflorSelections/"
    end

    # GET /conectiflor_selections/1
    # GET /conectiflor_selections/1.json
    def show
    end

    # GET /conectiflor_selections/new
    def new
        @conectiflor_selection = ConectiflorSelection.new
    end

    # GET /conectiflor_selections/1/edit
    def edit
    end

    # POST /conectiflor_selections
    # POST /conectiflor_selections.json
    def create
        @conectiflor_selection = ConectiflorSelection.new(conectiflor_selection_params)

        respond_to do |format|
            if @conectiflor_selection.save
                format.html { redirect_to @conectiflor_selection, notice: 'Conectiflor selection was successfully created.' }
                format.json { render :show, status: :created, location: @conectiflor_selection }
            else
                format.html { render :new }
                format.json { render json: @conectiflor_selection.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /conectiflor_selections/1
    # PATCH/PUT /conectiflor_selections/1.json
    def update
        respond_to do |format|
            if @conectiflor_selection.update(conectiflor_selection_params)
                format.html { redirect_to @conectiflor_selection, notice: 'Conectiflor selection was successfully updated.' }
                format.json { render :show, status: :ok, location: @conectiflor_selection }
            else
                format.html { render :edit }
                format.json { render json: @conectiflor_selection.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /conectiflor_selections/1
    # DELETE /conectiflor_selections/1.json
    def destroy
        @conectiflor_selection.destroy
        respond_to do |format|
            format.html { redirect_to conectiflor_selections_url, notice: 'Conectiflor selection was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_conectiflor_selection
        @conectiflor_selection = ConectiflorSelection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conectiflor_selection_params        
        params.require(:conectiflor_selection).permit(:code, :location, :trademark, :denomination, :year, :status, :numPlants, :color_id, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks,:conectiflor_picture_id,:likes)
    end
end
