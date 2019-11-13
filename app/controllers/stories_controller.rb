class StoriesController < ApplicationController

    def index
        @stories = Story.all
        @countries = Country.all 
        @writers = Writer.all 
    end 

    def new
        @story = Story.new 
        @writers = Writer.all
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
        @countries = Country.all
        @tags = Tag.all
    end 

    def update
        @story = Story.find(params[:id])   
        @story = Story.update(story_params[:name], story_params[:age])
        redirect_to story_path(@story) 

        @countries = Country.all
        @tags = Tag.all
    end 

    def destroy 

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
