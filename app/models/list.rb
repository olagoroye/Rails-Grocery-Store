class List < ApplicationRecord

  belongs_to :user
  
  has_many :list_items, dependent: :delete_all 
  has_many :items, through: :list_items

  accepts_nested_attributes_for :list_items, reject_if: proc { |attributes| attributes['quantity'].blank? }
  
  validates :title, presence: true

   scope :title, -> { where(title: true) }


end
