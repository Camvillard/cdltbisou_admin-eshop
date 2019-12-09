class Product < ApplicationRecord
  monetize :price_cents

  belongs_to :category

  has_many :cart_products

  has_many :product_tags
  has_many :tags, through: :product_tags
end
