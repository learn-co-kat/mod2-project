class StoriesController < ApplicationController

    def index
        @stories = Story.all
        @countries = Country.all 
        @writers = Writer.all 
    end 

    def new
        @story = Story.new 
        @tags = Tag.all 
        @writers = Writer.all 
        @countries = Country.all
    end 

    def create
        @story = Story.new(story_params) 
        if @story.valid?
            @author = Writer.create(name: writer_name, age: writer_age)  
            @story.writer_id = @author.id 
            @story.save 
            redirect_to story_path(@story)
        else  
            render :new 
        end 
    end 

    def show  
        @story = Story.find(params[:id]) 
        @writer = Writer.find(@story.writer_id)  
    end 

    def edit
        @story = Story.find(params[:id]) 
        @tags = Tag.all 
        @writers = Writer.all 
        @countries = Country.all
    end 

    def update
        @story = Story.find(params[:id])   
        @story.update(story_params)
        redirect_to story_path(@story) 
    end 

    def destroy 
        Story.find(params[:id]).destroy
        redirect_to stories_path 
    end 

    private

    def story_params
        params.require(:story).permit(:content, :subject, :writer_id, :country_id, writers_attributes: [:name, :age]) 
    end 

    def writer_name
        params.require(:story)[:writers][:name]
    end 

    def writer_age
        params.require(:story)[:writers][:age]
    end 
end
