# == Schema Information
#
# Table name: categories
#
#  id         :integer(8)      not null, primary key
#  name       :string(255)
#  is_visible :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  parent_id  :integer(4)
#

class Category < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position 

  has_many :products

  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id', optional:true

  def selector_name
    parent_id ? "--#{name}":"#{name}"
  end

  def self.selectable
    Category.where(parent_id:nil).inject([]){|r,c| r << c; r+=c.subcategories}
  end

end
