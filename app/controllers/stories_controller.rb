class StoriesController < ApplicationController

    def index
        @stories = Story.all
        @countries = Country.all 
    end 

    def new
        @story = Story.new 
        @countries = Country.all 
        @tags = Tag.all 
        @writers = Writer.all 
    end 

    def create
        @story = Story.new(story_params)
        if @story.save
            redirect_to story_path(@story)
        else  
            render :new 
        end 

        @writer = Writer.create(params[:name], params[:age]) 

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
