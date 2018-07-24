class Person < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :secret, in: 6..24
    validates_inclusion_of :country, in: ['Canada', 'Mexico', 'UK', 'USA'],  message: "must be one of Canada, Mexico, UK, USA"
    validates_pressence_of :description, if: :require_description_presence?
    
    def require_description_presence?
        self.can_send_email
    end
end
