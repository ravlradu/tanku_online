class Category < ApplicationRecord

  has_many :products

  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id', optional:true

end
