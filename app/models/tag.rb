class Tag < ApplicationRecord
    has_many :story_tags
    validates :name, presence: :true 
end
