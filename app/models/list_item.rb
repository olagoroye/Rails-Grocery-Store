class ListItem < ApplicationRecord
  belongs_to :list
  belongs_to :item

  def item_name
    if item
      item.name
    end
  end
  def item_price
    if item
      item.price
    end
  end
  def item_description
    if item
      item.description
    end
  end

  
end
