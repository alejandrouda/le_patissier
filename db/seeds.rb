# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Deleting all products..."
Product.delete_all

p "Creating products..."

media_luna = Product.new(
    name: "Media Luna",
    description: "Media lunas argentinas preparadas artesanalmente",
    price: 1.75
)
media_luna.images.attach(io: URI.open("https://res.cloudinary.com/dfyhqslry/image/upload/w_1000,ar_16:9,c_fill,g_auto,e_sharpen/v1594223632/Nou%20granados/Alimentos%20y%20bebidas/Medio_Dia_jxim3i.jpg"), filename: 'Medio_Dia_jxim3i.jpg', content_type: 'jpg')
media_luna.save!
p media_luna