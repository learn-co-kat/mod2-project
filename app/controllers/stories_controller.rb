class StoriesController < ApplicationController

    def index
        @stories = Story.all
        @countries = Country.all 
        @writers = Writer.all 
        @tags = Tag.all
    end 

    def new
        @story = Story.new 
        @tags = Tag.all 
        @writers = Writer.all 
        @countries = Country.all
    end 

    def create
        if writer_name == ""
            @story = Story.new(story_params)
            @tags = filtertags
            @story.save 
            @tags.each do |tag_id| 
                StoryTag.create(:tag_id => tag_id, :story_id => @story.id) 
            end
            redirect_to story_path(@story) 

            elsif writer_name.length > 0 
                @author = Writer.create(name: writer_name, age: writer_age) 
                @story = Story.new(story_params) 
                @story.writer_id = @author.id  
                @tags = filtertags
                @tags.each do |tag_id|
                    StoryTag.create(:tag_id => tag_id, :story_id => @story.id) 
                end
                @story.save 
                redirect_to story_path(@story)

        else  
            render :new 
        end 
    end 

    def show  
        @story = Story.find(params[:id]) 
        @writer = Writer.find(@story.writer_id) 
        @tags = @story.tags 
    end 

    def edit
        @story = Story.find(params[:id]) 
        @tags = Tag.all 
        @writers = Writer.all 
        @countries = Country.all
    end 

    def update
        @story = Story.find(params[:id])  
        @tags = filtertags 
        @tags.each do |tag_id| 
            StoryTag.create(:tag_id => tag_id, :story_id => @story.id) 
        end
        @story.update(story_params)
        redirect_to story_path(@story) 
    end 

    def destroy 
        Story.find(params[:id]).destroy
        redirect_to stories_path 
    end 

    private

    def story_params
        params.require(:story).permit(:content, :subject, :writer_id, :country_id)
    end 

    def writer_name
        params.require(:story)[:writers][:name]
    end 

    def writer_age
        params.require(:story)[:writers][:age]
    end 

    def filtertags
        params[:story][:tags].delete_if { |num| num.to_i == 0}
    end 
end