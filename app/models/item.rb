class Item < ApplicationRecord
    
    has_many :list_items
    has_many :lists, through: :list_items

    validates :name, :price, :description, presence: true


scope :items_less_than_ten, -> (price){where("price < ?", 10) }


def self.favourite_items
   @items = []
    @item = Item.all.each do|item|      
   
 if (item.lists.length > 1) 
   @items << item
 end

end
binding.pry
end 

end
