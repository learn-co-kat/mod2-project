class Story < ApplicationRecord
    belongs_to :writer
    belongs_to :country 
    has_many :story_tags
    accepts_nested_attributes_for :writer
end
