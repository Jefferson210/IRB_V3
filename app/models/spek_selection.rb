class SpekSelection < ActiveRecord::Base
    belongs_to :color
    #    relacion para agregar varias imagenes a una variedad
    has_many :spek_selections_pictures, dependent: :destroy
    belongs_to :spek_selections_picture

    #    VALIDATIONS
    validates :code, presence:{ message:"Obligatory"}, uniqueness: {case_sensitive: false, message:"already exists"}    
    validates :location, :allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}    
    validates :trademark,:allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}
    validates :denomination,:allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}

    # get all pictures from selection
    def pictures
        allPictures = SpekSelectionsPicture.where(spek_selection_id: self.id)       
        allPictures.map{|u|             
            if u.spek_selection_id                                  
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
        mainPicture = SpekSelectionsPicture.where(id: self.spek_selections_picture_id)       
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
        imageBase64 = Base64.encode64(File.read($imgPathSpek + _pictureName.gsub(/\?.*+/,''))).gsub("\n",'')                    
    end

end
