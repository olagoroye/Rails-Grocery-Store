class ListItemsController < ApplicationController
    def index
        @item = Item.all
    end 

    def show 
        @item = Item.find_by(id: params[:id])

    end 
end
