class Writer < ApplicationRecord
    has_many :stories
    has_many :countries, through: :stories
    has_many :tags, through: :stories 
end
