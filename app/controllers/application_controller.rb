require 'barby'
require 'barby/barcode/code_128'    
require 'barby/outputter/png_outputter'  
require 'chunky_png'
class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token
    before_action :configure_permitted_parameters, if: :devise_controller?

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
end
