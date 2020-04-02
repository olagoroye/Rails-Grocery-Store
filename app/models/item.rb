class Item < ApplicationRecord
    
    has_many :list_items
    has_many :lists, through: :list_items

    validates :name, :price, :description, presence: true


scope :items_less_than_ten, -> {where("price < ?", 10) }

# scope :title, -> { where(title: true) }

end
