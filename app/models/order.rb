# == Schema Information
#
# Table name: orders
#
#  id            :integer(8)      not null, primary key
#  payload       :text(65535)
#  delivery_type :string(255)
#  delivered_at  :datetime
#  payload_price :integer(4)
#  printed_at    :datetime
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Order < ApplicationRecord

  TYPES = {
      'pickup' => 'ridicare din magazin',
      'delivery' => 'livrare la domiciliu'
  }

  serialize :payload

end

