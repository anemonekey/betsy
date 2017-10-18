# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Merchants: 21, 22
merchants = Merchant.create([
  { username: 'MagicBrian', email: 'brian@spider.com', id: 21, created_at: Time.now, updated_at: Time.now },
  { username: 'Taako', email: 'abra@cafu.com', id: 22, created_at: Time.now, updated_at: Time.now }
  ])

# Orders: 21, 22, 23, 24
orders = Order.create([
  { cust_name: 'Sar Squatch', status: 'completed', cust_email: 'big@feet.com', cust_cc: '1234567890', cust_cc_exp: '06/19', cust_addr: 'The Woods', id: 21, created_at: Time.now, updated_at: Time.now },
  { cust_name: 'Ponyboy', status: 'paid', cust_email: 'big@feet.com', cust_cc: '1234552567890', cust_cc_exp: '06/19', cust_addr: 'Cartoon Network', id: 22, created_at: Time.now, updated_at: Time.now },
  { cust_name: 'Maleficent', status: 'completed', cust_email: 'veryevilfairy@hotmail.com', cust_cc: '1234567823423490', cust_cc_exp: '04/25', cust_addr: '12345 Perceforest', id: 23, created_at: Time.now, updated_at: Time.now },
  { cust_name: 'Witchy Witcherson', status: 'completed', cust_email: 'witch@witch.com', cust_cc: '1234567890234234', cust_cc_exp: '06/22', cust_addr: '294 Witch St, Witchville', id: 24, created_at: Time.now, updated_at: Time.now }
  ])

# Products: 21, 22, 23, 24
products = Product.create([
  { name: 'Umbra Staff', image_url: 'https://image.freepik.com/free-photo/umbrella-closed_19-121570.jpg', price: 693.39, quantity: 10, description: "This is a supremely powerful magic wand, imbued with the soul of a great wizard. It's definitely not just an umbrella.", id: 21, created_at: Time.now, updated_at: Time.now, merchant_id: 22  },
  { name: 'My Little Pony (REAL)', image_url: 'https://lilyladewig.files.wordpress.com/2009/04/glitter-pony-2.jpg', price: 123.45, quantity: 100, description: "REAL PONY REAL MAGIC!! NOT FAKE", id: 22, created_at: Time.now, updated_at: Time.now, merchant_id: 21  },
  { name: 'Witch\'s Tears', image_url: 'https://i.ebayimg.com/images/g/BlsAAOSwWnFV84vC/s-l300.jpg', price: 21.21, quantity: 50, description: "You have to be really mean to a witch to make these.", id: 23, created_at: Time.now, updated_at: Time.now, merchant_id: 21  }
  ])

order_products = OrderProduct.create([
  { status: 'shipped', quantity: '1', order_id: 24, product_id: 21, created_at: Time.now, updated_at: Time.now, id: 21 },
  { status: 'shipped', quantity: '3', order_id: 24, product_id: 23, created_at: Time.now, updated_at: Time.now, id: 22 },
  { status: 'shipped', quantity: '1', order_id: 22, product_id: 22, created_at: Time.now, updated_at: Time.now, id: 23 },
  { status: 'shipped', quantity: '3', order_id: 21, product_id: 23, created_at: Time.now, updated_at: Time.now, id: 24 },
  { status: 'shipped', quantity: '1', order_id: 23, product_id: 21, created_at: Time.now, updated_at: Time.now, id: 25 }
  ])

reviews = Review.create([
  { rating: 5, description: 'very nice and magic', product_id: 22, created_at: Time.now, updated_at: Time.now, id: 21 },
  { rating: 1, description: 'these are wizards tears, NOT witch\'s tears. seller should be ashamed', product_id: 23, created_at: Time.now, updated_at: Time.now, id: 22 }
  ])
