class List < ApplicationRecord

  belongs_to :user
  
  has_many :list_items, dependent: :delete_all 
  has_many :items, through: :list_items

  accepts_nested_attributes_for :list_items, reject_if: proc { |attributes| attributes['quantity'].blank? }
  
  validates :title, presence: true

  scope :title, -> { where(title: true) }


  # validate :list_must_have_at_least_one_item

  # def list_must_have_at_least_one_item
  #   if item_ids.empty? # condition_fails
  #     # add an error
  #     errors.add(:items, "must exist -- choose at least one!")
  #   end
  # end
  # def list_items_attributes= (item_info)
  #   binding.pry
  #   # find or create an item and store in variable using attr (name, price,desciption)
  #   # then create list_item with three att.. self is the current list, item just created/found and quantity
  
  #   # item = Item.find_or_create_by(item_info)
  #   # self.item = item if item.valid? || !self.item
  # end


end
