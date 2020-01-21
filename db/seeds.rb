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

calendriers = Category.create!(
  name: "calendriers"
)

affiches = Category.create!(
  name: "affiches"
)

puts "creating tags"

Tag.create!(
  name: "pour tous les jours"
)

amour = Tag.create!(
  name: "pour les mots d'amour"
)

Tag.create!(
  name: "pour les jours de fête"
)

maison = Tag.create!(
  name: "pour la maison"
)

organisation = Tag.create!(
  name: "pour l'organisation'"
)

puts "creating products"

calendar = Product.create!(
  name: "maxi calendrier",
  description: "a real cool calendar",
  photo: "",
  stock: 12,
  sku: "CAL_2020",
  category: calendriers,
  price_cents: 5200
)

how = Product.create!(
  name: "how you doin' ?",
  description: "description pour les cartes",
  photo: "",
  stock: 12,
  sku: "CAR_HOW",
  category: cartes,
  price_cents: 500
)

puts "associating tags for products"

ProductTag.create!(
  product: calendar,
  tag: organisation
)

ProductTag.create!(
  product: calendar,
  tag: organisation
)

ProductTag.create!(
  product: how,
  tag: amour
)
