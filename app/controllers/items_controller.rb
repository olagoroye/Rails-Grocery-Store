class ItemsController < ApplicationController
        def index 
            # binding.pry
            if params[:list_id]
                if list = List.find_by(id: params[:list_id])    
                @items = list.items #nested route 
                else
                    flash[:alert] = "List not found"
                    redirect_to list_items_path
                end
            else 
                if params[:price]
                 @items = Item.items_less_than_ten(params[:price])
                 
                else    
               
                    @items = Item.all
                
                end
            end
        end

        def new
            #check if it nested with proper id
            @list =List.find_by(id: params[:list_id])
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
            if params[:list_id]
                 @list =List.find_by(id: params[:list_id])  #parent    
                @item = @list.items.create(item_params) #  nested route
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
            if params[:list_id]
             if list = List.find_by(id: params[:list_id])    
                @items = list.items #nested route 
              else
                    flash[:alert] = "Item not found"
                    redirect_to list_items_path
              end
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


     
    
 