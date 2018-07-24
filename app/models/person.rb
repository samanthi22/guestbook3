class Person < ApplicationRecord
    after_save :store_photo
    validates_presence_of :name
    validates_presence_of :secret, in: 6..24
    validates_inclusion_of :country, in: ['Canada', 'Mexico', 'UK', 'USA'],  message: "must be one of Canada, Mexico, UK, USA"
    validates_presence_of :description, if: :require_description_presence?
    
    
    def require_description_presence?
        self.can_send_email
    end
    
    def store_photo
        if @file_data
            FileUtils.mkdir_p PHOTO_STORE
            File.open(photo_filename, 'wb') do |f|
                f.write(@file_data.read)
            end
            
            @file_data = nil
        end
    end
    
    def photo=(file_data)
        unless file_data.blank?
        @file_data = file_data
        
        self.extension = file_data.original_filename.split('.').last
    end
end

PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'

def photo_filename
    File.join PHOTO_STORE, "#{id}.#{extension}"
end

def photo_path
    "/photo_store/#{id}.#{extension}"
end

def has_photo?
    File.exists? photo_filename
end
end
