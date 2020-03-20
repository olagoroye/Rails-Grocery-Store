class ListsController < ApplicationController
    def index
        @lists = List.all
    end
  
    def new
        @list = List.new
        
      
        @items = Item.all
        Item.all.each { |item| @list.list_items.build(item_id: item.id )}
    end 
    def create
        # binding.pry
    #     @list = List.new(list_params)
    #     if @list.save
    #         redirect_to list_path(@list)
    #     else
    #         @users = User.all
    #         @items = Item.all
    #         render :new
    # end
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
     
      render :new
    end
    end 
    def show
        current_list
    end 
    def edit
        current_list
    end
    def update
        current_list
        if @list.update(list_params)
            redirect_to list_path(@list)
        else
            render :edit
        end 
    end
    
    private

    def current_list
      @list = List.find_by(id: params[:id])
      if !@list
        redirect_to lists_path
      end
    end

    def list_params
        params.require(:list).permit(:user_id, :title, list_items_attributes: [:item_id, :quantity], item_ids: [])
      end
end
