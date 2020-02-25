class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true

  before_create :create_slug
end
