class Api::V1::CompaniesApiController < ApplicationController
    before_action :set_company, only: [:show]
    before_action :authenticate_user!

    def index
        @company = Company.all     
        render json:  @company, :methods => :mainPicture                         
    end

    def show         
        render json: @company, :methods => :mainPicture                         
    end    

    private
    def set_company
        @company = Company.find(params[:id])
    end

    def company_params
        params.require(:company).permit(:name, :description, :address, :peopleContact, :mission, :vision, :phone, :cellPhone, :facebookContact, :email, :skypeContact, :webContact, :image, :removeImage)
    end

end
