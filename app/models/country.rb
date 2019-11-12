class Country < ApplicationRecord
    has_many :stories
    has_many :writers, through: :stories 
end
