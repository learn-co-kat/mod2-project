class WritersController < ApplicationController

    def index
        @writers = Writer.all
    end 

    def new
        @writer = Writer.new 
    end 

    def create
        @writer = Writer.create(writer_params) 
    end 

    def show
        @writer = Writer.find(params[:id]) 
    end 

    private

    def writer_params
        params.require(:writer).permit(:name, :age)
    end 

end
