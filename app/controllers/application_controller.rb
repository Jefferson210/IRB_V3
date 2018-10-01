require 'barby'
require 'barby/barcode/code_128'    
require 'barby/outputter/png_outputter'  
require 'chunky_png'
class ApplicationController < ActionController::Base 
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session
    skip_before_filter  :verify_authenticity_token
    before_action :configure_permitted_parameters, if: :devise_controller?

    def controllerName(controller)
        case controller
        when "users"
            nameToShow = "Users"
        when "genetic_banks"
            nameToShow = "Genetic Bank"
        when "crossings"
            nameToShow = "Crossings"
        when "seeds"
            nameToShow = "Seeds"
        when "germinations"
            nameToShow = "Germinations"        
        when "one_offsprings"
            nameToShow = "Offspring 1"
        when "two_offsprings"
            nameToShow = "Offspring 2"
        when "three_offsprings"
            nameToShow = "Offspring 3"
        when "irb_selections"
            nameToShow = "International Rose Breeder(IRB)"
        when "spek_selections"
            nameToShow = "Spek Rosen"
        when "conectiflor_selections"
            nameToShow = "Conectiflor"                
        end
    end
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role])
        #        devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username,:role])
    end

    #enviar mensaje de acceso denegado
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to genetic_banks_path #,:flash => { :error => "You are not authorized to access this page." } 
    end

    #para solucionar el error de parametros que tiene cancan con rails 4+
    before_filter do
        resource = controller_name.singularize.to_sym
        method = "#{resource}_params"
        params[resource] &&= send(method) if respond_to?(method, true)
    end

    #    redirige al formulario de salida con las dimensiones de la hoja del PDF a mostrar
    def respondToPDF(controller)
        controllerPath = ""
        case controller
        when "GeneticBank"
            controllerPath = "genetic_banks"
        when "Crossing"
            controllerPath = "crossings"
        when "Seed"
            controllerPath = "seeds"   
        when "IrbSelection"
            controllerPath = "irb_selections"
        when "SpekSelection"
            controllerPath = "spek_selections"
        when "ConectiflorSelection"
            controllerPath = "conectiflor_selections"         
        end
        respond_to do |format|
            format.html         
            format.pdf do 
                render pdf: "PDF_#{'example'}",
                template: controllerPath+'/generateBarCode.pdf.erb',
                layout:    'codeBar.pdf',
                show_as_html: params[:debug].present?,                     
                outline: {   
                    outline:           true,
                    outline_depth:     50 },
                margin:  {   
                    top:               20, # default 10 (mm)
                    bottom:            20,
                    left:              2,
                    right:             2 }
            end
        end
    end

    #    Transforma el/los codigo(s) a una url para que la gema wicked_PDF imprima el codigo de barra en su hoja
    def barcodeOutPut( modelObject )  
        case modelObject.class.name
        when "GeneticBank"
            barcodeString = modelObject.code
        when "Crossing"
            barcodeString = modelObject.codeCross+"-"+modelObject.numRepeat.to_s
        when "Seed"
            barcodeString = modelObject.codeCross+"-"+modelObject.crossing_id.to_s   
        when "IrbSelection"
            barcodeString = modelObject.code 
        when "SpekSelection"
            barcodeString = modelObject.code 
        when "ConectiflorSelection"
            barcodeString = modelObject.code         
        end
        barcode = Barby::Code128B.new(barcodeString)
        data = barcode.to_image(height: 200, margin: 5).to_data_url        
    end 

end
