# == Schema Information
#
# Table name: products
#
#  id              :integer(8)      not null, primary key
#  name            :string(255)
#  description     :text(65535)
#  category_id     :integer(4)
#  is_visible      :boolean
#  price           :integer(4)
#  available_count :integer(4)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  externalid      :string(255)
#

require 'csv'
class Product < ApplicationRecord

  belongs_to :category, optional: true

  has_one_attached :image

  def display_price
    (price.to_f/100).round(2)
  end

  def display_old_price
    (old_price.to_f/100).round(2)
  end

  def image_url(size)
    image.attached? ? image.variant(resize_to_fill: size) : "product/product1.jpg"
  end

  def cart_image_url(size)
    image.attached? ? image.variant(resize_to_fill: size) : "s-product/product.jpg"
  end

  def self.import_from_csv file_name
    begin
      CSV.foreach(file_name, {:headers => true, :header_converters => :symbol, :col_sep=>";"}) do |row|

        attributes = {
          name: row[:descriere],
          price: (row[:pret].to_f*100).to_i,
          externalid: row[:cod],
          um: row[:um],
          available_count: row[:cantitate],
          is_visible: true
        }
        puts "#{attributes.inspect}"
        product = Product.where(externalid: row[:cod]).first
        if product
          product.update attributes
        else
          Product.create attributes
        end
      end
    rescue Exception=>e
      Rails.logger.info "Error when importing products \n #{e.inspect}"
    end
  end

end
