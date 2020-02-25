class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def create_slug
    return if slug
    puts "creating the product"
    slug = self.slug = self.name.gsub(/(\s|,)/, "-")
    slug.gsub!(/(é|è)/, "e").gsub!(/(à)/, "a")
    p self
    p slug
  end
end
