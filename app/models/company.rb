class Company < ActiveRecord::Base  
    attr_accessor :removeImage  
    before_save :delete_image, if: -> { removeImage == '1'}

    has_attached_file :image, styles: { medium: "600x600>", thumb: "300x300>" }, path: ":rails_root/public/assets/images/company/:filename",
    url: "/assets/images/company/:filename"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
  # get picture from company
    def mainPicture           
      imageBase64 = getBase64(self.image_file_name)
    end

    def getBase64 (_pictureName)
        imageBase64 = Base64.encode64(File.read($imgPathCompany + _pictureName.gsub(/\?.*+/,''))).gsub("\n",'')                    
    end

    private
    def delete_image
      self.image = nil           
    end
  

end
