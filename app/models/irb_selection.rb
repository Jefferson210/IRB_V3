class IrbSelection < ActiveRecord::Base    
    belongs_to :three_offspring
    belongs_to :irb_selections_picture

    #    relacion para agregar varias imagenes a una variedad
    has_many :irb_selections_pictures, dependent: :destroy

    #    VALIDATIONS
    validates :three_offspring_id, presence:{ message:"Obligatory"}
    validates :code, presence:{ message:"Obligatory"}, uniqueness: {case_sensitive: false, message:"already exists"}    
    validates :location, :allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}    
    validates :trademark,:allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}
    validates :denomination,:allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}    

    # get all pictures from selection
    def pictures
        allPictures = IrbSelectionsPicture.where(irb_selection_id: self.id)       
        allPictures.map{|u|             
            if u.irb_selection_id                                  
                imageBase64 = getBase64($imgPathIrb ,u.picture_file_name)
            else
                imageBase64 = ""   
            end        
            u.attributes.merge(  
                :imageBase64 => imageBase64
                )}         
    end
    # get main picture from selection
    def mainPicture
        mainPicture = IrbSelectionsPicture.where(id: self.irb_selections_picture_id)       
        mainPicture.map{|u|             
            if u.picture                      
                imageBase64 = getBase64($imgPathIrb ,u.picture_file_name)                
            else
                imageBase64 = ""   
            end        
            u.attributes.merge(  
                :imageBase64 => imageBase64
                )}         
    end

    def getBase64 (_pathFIle,_pictureName)
        imageBase64 = Base64.encode64(File.read(_pathFIle + _pictureName.gsub(/\?.*+/,''))).gsub("\n",'')                    
    end
end
