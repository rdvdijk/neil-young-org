class Category < ActiveRecord::Base
  has_many :links

  default_scope order(:sort_order)
end
