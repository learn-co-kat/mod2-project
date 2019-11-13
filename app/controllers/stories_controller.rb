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
        if @story.valid?
            @story.save 
            # byebug
            Writer.create(name: writer_name, age: writer_age)  
            redirect_to story_path(@story)
        else  
            render :new 
        end 
    end 

    def show 
        @story = Story.find(params[:id]) 
        @writers = Writer.all
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
