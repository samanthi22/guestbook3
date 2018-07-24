class Person < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :secret, in: 6..24
    validates_inclusion_of :country, in: ['Canada', 'Mexico', 'UK', 'USA'],  message: "must be one of Canada, Mexico, UK, USA"
end
