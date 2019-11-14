class Story < ApplicationRecord
    belongs_to :writer
    belongs_to :country 
    has_many :story_tags
    accepts_nested_attributes_for :writer

    # def self.find_stories_by_writer

    # end 

end
