class ItemsController < ApplicationController
        def index 
            @items = Item.new
            if params[:list_id]
                if List.find_by(id: params[:list_id])
                # @items = List.find(params[:list_id])
                list_items = ListItem.where("list_id = ?",params[:list_id])
                @items = list_items.map{|list_item| Item.find_by(id: list_item.item_id)}

                
                else
                    flash[:alert] = "List not found"
                    redirect_to list_items_path
                end
            else 
                @items = Item.all 
            end
        end
        def new
            #check if it nested with proper id

            @list =List.find_by(id: params[:list_id])
        #    @list =List.find_by(id: params[:list_id])
        # binding.pry
            @item = Item.new
        end
        def show
            if Item.find_by(id: params[:id])
                @item = Item.find(params[:id])
                list_items = ListItem.where("item_id = ?",params[:id])
                @lists = list_items.map{|list_item| List.find_by(id: list_item.list_id)}

            else
                flash[:alert] = "Item not found"
                redirect_to list_items_path
        end 

        end

        def create
            # if the list_exist , else list doesn't exist
            # binding.pry
            if params[:list_id]
                 @list =List.find_by(id: params[:list_id])  #parent
                #  nested route
                @item = @list.items.create(item_params)
            else
                @item = Item.new(item_params)
                
            end
           
            if @item.save
            redirect_to items_path

           else
            render :new
            end
        end
       
        def edit
            if Item.find_by(id: params[:id])
                @item = Item.find(params[:id])
                list_items = ListItem.where("item_id = ?",params[:id])
                @lists = list_items.map{|list_item| List.find_by(id: list_item.list_id)}

            else
                flash[:alert] = "Item not found"
                redirect_to list_items_path
        end 
        end
        def update
                @item = Item.find(params[:id])
                if @item.update(item_params)
                    redirect_to item_path(@item)
                else
                    render :edit
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