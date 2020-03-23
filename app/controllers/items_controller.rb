class ItemsController < ApplicationController
        def index 
            @items = Item.new
            if params[:list_id]
                if List.find_by(id: params[:list_id])
                @items = List.find(params[:list_id])
                else
                    flash[:alert] = "List not found"
                    redirect_to list_items_path
                end
            else 
                @items = Item.all 
            end
        end
        def new
            @item = Item.new
        end
        def show
            if Item.find_by(id: params[:id])
                @item = Item.find(params[:id])
            else
                flash[:alert] = "Item not found"
                redirect_to list_items_path
        end 

        end

        def create

            @list = current_user.lists.build(params[:id]) 
            @item = @list.items.build(item_params)
            if @item.save
            redirect_to lists_path(@lists)

            # user can pick item directly from list
            # @item = Item.new(items_params)
            
            # if @item.save
            #   redirect_to items_path(@items)
           else
            render :new
            end
        end
  
    
    
    def item_params
        params.require(:item).permit(:user_id, :brand, :name, :description, :price, list_items_attributes: [:item_id, :quantity], item_ids: [])
      end
    
end


     
    
 # def new
    #     #check if it's nested & it's a proper id
    #     if params[:list_id] && list = List.find_by_id(params[:list_id])
    #       #nested route
    #       @item = list.items.build #has_many
    #     else
    #       #unnested
    #       @item = Item.new
    #       @item.build.list  #belongs_to
    #     end
    #   end

    #   def create
    #     @item = current_user.items.build(items_params)
    #     if @item.save
    #         redirect_to items_path(@items)
    #     else
    #       @item.build_list unless @item.list
    #       render :new
    #     end
    #   end