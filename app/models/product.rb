class Product < ApplicationRecord
  monetize :price_cents

  belongs_to :category

  has_many :cart_products

  has_many :product_tags
  has_many :tags, through: :product_tags

  validates :name, presence: true

  before_create :create_slug

  def create_slug
    return if slug
    puts "creating the product"
    slug = self.slug = self.name.gsub(/(\s|,)/, "-")
    slug.gsub!(/(é|è)/, "e").gsub!(/(à)/, "a")
    p self
    p slug
  end
end
