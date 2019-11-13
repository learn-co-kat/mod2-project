class Story < ApplicationRecord
    belongs_to :writer
    belongs_to :country 
    has_many :story_tags
    accepts_nested_attributes_for :writer
    accepts_nested_attributes_for :tags

    # def @find_country
    #     country.find_by
    # end 

end
