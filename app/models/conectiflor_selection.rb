class ConectiflorSelection < ActiveRecord::Base
    belongs_to :color
    belongs_to :conectiflor_picture
    #    relacion para agregar varias imagenes a una variedad
    has_many :conectiflor_pictures, dependent: :destroy

    #    VALIDATIONS
    validates :code, presence:{ message:"Obligatory"}, uniqueness: {case_sensitive: false, message:"already exists"}    
    # validates :location, :allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}    
    validates :trademark,:allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}
    validates :denomination,:allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}

    # get all pictures from selection
    def pictures
        allPictures = ConectiflorPicture.where(conectiflor_selection_id: self.id)       
        allPictures.map{|u|             
            if u.conectiflor_selection_id                                  
                imageBase64 = getBase64(u.picture_file_name)
            else
                imageBase64 = ""   
            end        
            u.attributes.merge(  
                :imageBase64 => imageBase64
                )}         
    end
    # get main picture from selection
    def mainPicture
        mainPicture = ConectiflorPicture.where(id: self.conectiflor_selection_id)       
        mainPicture.map{|u|             
            if u.picture                      
                imageBase64 = getBase64(u.picture_file_name)                
            else
                imageBase64 = ""   
            end        
            u.attributes.merge(  
                :imageBase64 => imageBase64
                )}         
    end

    def getBase64 (_pictureName)
        imageBase64 = Base64.encode64(File.read($imgPathConect + _pictureName.gsub(/\?.*+/,''))).gsub("\n",'')                    
    end
    
end
