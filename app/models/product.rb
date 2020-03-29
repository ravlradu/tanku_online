require 'csv'
class Product < ApplicationRecord

  belongs_to :category, optional: true

  has_one_attached :image

  def display_price
    (price.to_f/100).round(2)
  end

  def image_url(size)
    image.attached? ? image.variant(resize_to_fill: size) : "product/product1.jpg"
  end

  def self.import_from_csv file_name
    begin
      CSV.foreach(file_name, {:headers => true, :header_converters => :symbol}) do |row|

        attributes = {
          name: row[:descriere],
          price: row[:pret].to_i*100,
          externalid: row[:barcode],
          available_count: row[:cantitate]
        }
        puts "#{attributes.inspect}"
        product = Product.where(externalid: row[:barcode]).first
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
