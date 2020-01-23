class AddSlugToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :slug, :string
    add_column :products, :slug, :string
    add_column :tags, :slug, :string
  end
end
