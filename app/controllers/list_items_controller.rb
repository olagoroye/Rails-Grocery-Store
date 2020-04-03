class ListItemsController < ApplicationController

    def destroy
        @list_item= ListItem.find_by(list_id: params[:list_id], item_id: params[:item_id] )
   # binding.pry
        @list_item.destroy
        redirect_to list_items_path(@list_item.list_id)
   
end

   
end
