class StoriesController < ApplicationController

    def index
        @stories = Story.all
        @countries = Country.all 
    end 

    def new
        @story = Story.new 
        @countries = Country.all 
    end 

    def create
        @story = Story.create(story_params)
        redirect_to story_path(@story)
    end 

    def show 
        @story = Story.find(params[:id]) 
    end 

    def edit
        @story = Story.find(params[:id]) 
    end 

    def update
        @story = Story.find(params[:id]) 
        @story = Story.update(story_params) 
        redirect_to story_path(@story) 
    end 

    def destroy 

    end 

    private

    def story_params
        params.require(:story).permit(:content, :subject, :writer_id, :country_id) 
    end 

end
