class TagController < ApplicationController

def show
    @tag = Tag.find(params[:id])
    @stories = Story.all 
end 

end 