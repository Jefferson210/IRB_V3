class IrbSelectionsController < ApplicationController
    before_action :set_irb_selection, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def generateBarCode
        @barcode = Hash.new
        @codeIrbSelections = params[:barCodeSelect]        
        if @codeIrbSelections != nil
            @codeIrbSelections.each do |irbId|
                if irbId != "multiselect-all"
                    @irbSelection = IrbSelection.find(irbId)
                    @barcode[@irbSelection.code] = barcodeOutPut(@irbSelection); 
                end
            end
        end
        respondToPDF("IrbSelection")  
    end

    # GET /irb_selections
    # GET /irb_selections.json
    def index
        @irb_selections = IrbSelection.all
        @pictures = IrbSelectionsPicture.all
        @irbSelections = initialize_grid(IrbSelection,
            include: [{three_offspring: :two_offspring}])
        @irbSelectionsImgPath = "/assets/images/irbSelections/" 
    end

    # GET /irb_selections/1
    # GET /irb_selections/1.json
    def show
    end

    def selectColor 
        @objectIrbSelection = ThreeOffspring.find(params[:id])
        respond_to do |format|
            format.json {render :json => @objectIrbSelection}
        end
    end


    # GET /irb_selections/new
    def new
        @irb_selection = IrbSelection.new
    end

    # GET /irb_selections/1/edit
    def edit
    end

    # POST /irb_selections
    # POST /irb_selections.json
    def create
        @irb_selection = IrbSelection.new(irb_selection_params)

        respond_to do |format|
            if @irb_selection.save
                if params[:images]              
                    params[:images].each { |image|
                      @irb_selection.irb_selection_pictures.create(picture: image)
                    }
                end 
                format.html { redirect_to @irb_selection, notice: 'Irb selection was successfully created.' }
                format.json { render :show, status: :created, location: @irb_selection }
                format.js
            else
                format.html { render :new }
                format.json { render json: @irb_selection.errors, status: :unprocessable_entity }
                format.js
            end
        end
    end

    # PATCH/PUT /irb_selections/1
    # PATCH/PUT /irb_selections/1.json
    def update
        respond_to do |format|
            if @irb_selection.update(irb_selection_params)
                if params[:images]              
                    params[:images].each { |image|
                      @irb_selection.irb_selection_pictures.create(picture: image)
                    }
                end 
                format.html { redirect_to @irb_selection, notice: 'Irb selection was successfully updated.' }
                format.json { render :show, status: :ok, location: @irb_selection }
                format.js
            else
                format.html { render :edit }
                format.json { render json: @irb_selection.errors, status: :unprocessable_entity }
                format.js
            end
        end
    end

    # DELETE /irb_selections/1
    # DELETE /irb_selections/1.json
    def destroy
        begin
        @irb_selection.destroy
        respond_to do |format|
            format.html { redirect_to irb_selections_url, notice: 'IRB Selection was successfully destroyed.' }
            format.json { head :no_content }
            format.js
        end
        rescue ActiveRecord::DeleteRestrictionError => e
            sweetalert_error("#{e}", 'Error', persistent: 'Ok!')   
            respond_to do |format|
                format.html {redirect_to irb_selections_url}
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_irb_selection
        @irb_selection = IrbSelection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def irb_selection_params
        params.require(:irb_selection).permit(:three_offspring_id, :code, :location, :trademark, :denomination, :year, :status, :numPlants, :color, :scent, :headSize, :numPetals, :steamLenght, :production, :opening, :abnormality, :remarks, :irb_selections_picture_id,:likes)
    end
end
