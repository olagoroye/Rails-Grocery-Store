class ListsController < ApplicationController
    
    def new
        @list = List.new
    end 
    def create
        @order = Order.create(param)
    end 
    def show
    end 
end
