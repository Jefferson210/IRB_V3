json.extract! company, :id, :name, :description, :address, :personContact, :mission, :vision, :phone, :cellPhone, :facebookContact, :email, :skypeContact, :webContact, :created_at, :updated_at
json.url company_url(company, format: :json)
