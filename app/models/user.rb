# == Schema Information
#
# Table name: users
#
#  id              :integer(8)      not null, primary key
#  is_admin        :boolean
#  email           :string(255)
#  password_digest :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class User < ApplicationRecord

  has_secure_password

end

