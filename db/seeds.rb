puts "cleaning database"

ProductTag.destroy_all
CartProduct.destroy_all
Tag.destroy_all
Category.destroy_all
Product.destroy_all
Cart.destroy_all
User.destroy_all

puts "creating users"

User.create!(
  first_name: "camille",
  last_name: "villard",
  password: "cccccc",
  email: "ca.villard@gmail.com",
  address: "7337 avenue de chateaubriand",
  zip_code: "H2R 2L7",
  province: "QC",
  city: "montréal",
  country: "CA",
)

puts "creating categories"

cartes = Category.create!(
  name: "cartes"
)

calendrier = Category.create!(
  name: "calendrier"
)

puts "creating tags"

Tag.create!(
  name: "pour tous les jours"
)

deux_mille_vingt = Tag.create!(
  name: "deux mille vingt"
)


puts "creating products"

calendar = Product.create!(
  name: "maxi calendrier",
  description: "a real cool calendar",
  photo: "",
  stock: 12,
  sku: "CAL_2020",
  category: calendrier,
  price_cents: 5200
)

puts "creating products"

ProductTag.create!(
  product: calendar,
  tag: deux_mille_vingt
)
