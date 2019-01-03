require 'factory_bot_rails'

include FactoryBot::Syntax::Methods

OrderItem.destroy_all
Order.destroy_all
Item.destroy_all
User.destroy_all

admin = create(:admin)
user = create(:user)
merchant_1 = create(:merchant)

merchant_2, merchant_3, merchant_4 = create_list(:merchant, 3)

inactive_merchant_1 = create(:inactive_merchant)
inactive_user_1 = create(:inactive_user)

item_1 = create(:item, name: "bees case", image: "https://hips.hearstapps.com/elleuk.cdnds.net/16/48/skinnydip-bees.jpg?crop=1.0xw:1xh;center,top&resize=480:*", user: merchant_1)
item_2 = create(:item, name: "eat pasta case", image: "https://cdn.shopify.com/s/files/1/0694/6735/products/eat-pasta_900x.jpg?v=1527131001", user: merchant_2)
item_3 = create(:item, name: "get your own case", image: "https://cdn.shopify.com/s/files/1/0770/1091/products/thou-shalt-get-her-own-money-phone-case_66d6f59c-8edc-494b-9196-4c1cfcfec5cc_1024x1024.jpg?v=1486139439", user: merchant_3)
item_4 = create(:item, name: "wooden case", image: "https://www.carved.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/e/se-tc1s_face.jpg", user: merchant_4)
item_5 = create(:item, name: "easy pickin's case", image: "https://www.fashionstylegears.com/wp-content/uploads/2018/07/nose-iphone-case-1.jpg", user: merchant_1)
item_6 = create(:item, name: "so many books case", image: "https://images.girlslife.com/posts/034/34246/case_1.0.png", user: merchant_2)
item_7 = create(:item, name: "stay weird case", image: "https://i.pinimg.com/originals/4d/71/f8/4d71f81a9b00ce3aed3d1a672ab4f002.jpg", user: merchant_3)
item_8 = create(:item, name: "smile more case", image: "https://cdn.shopify.com/s/files/1/0275/6675/products/smile_sb_2048x2048.jpg?v=1519236752", user: merchant_4)
item_9 = create(:item, name: "a lil bougie case", image: "https://cdn.shopify.com/s/files/1/0770/1091/products/a-lil-bougie-phone-case_8068036f-43f0-4eaa-aefe-533306f029b9_800x.jpg?v=1486139325", user: merchant_1)
item_10 = create(:item, name: "delicate flower case", image: "http://cdn.shopify.com/s/files/1/0407/7113/products/phone3_grande.jpg?v=1517417496", user: merchant_2)
item_11 = create(:item, name: "fatigue case", image: "https://cdn.shopify.com/s/files/1/0687/4327/files/camo_main.JPG?15321166250517783543", user: merchant_3)
item_12 = create(:item, name: "black grid case", image: "https://www.magpul.com/Files/Files/Images/Products/ElectronicsCases/MAG849/Gallery/BLK/MAG849-BLK.png?format=jpg&width=400&height=400&bgcolor=F5F5F5", user: merchant_4)
# create_list(:item, 10, user: merchant_1)

inactive_item_1 = create(:inactive_item, user: merchant_1)
inactive_item_2 = create(:inactive_item, user: inactive_merchant_1)

Random.new_seed
rng = Random.new

order = create(:completed_order, user: user)
create(:fulfilled_order_item, order: order, item: item_1, price: 1, quantity: 1, created_at: rng.rand(3).days.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_3, price: 3, quantity: 1, created_at: rng.rand(5).days.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_4, price: 4, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)

order = create(:order, user: user)
create(:order_item, order: order, item: item_1, price: 1, quantity: 1)
create(:fulfilled_order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).days.ago, updated_at: rng.rand(23).hours.ago)

order = create(:cancelled_order, user: user)
create(:order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
create(:order_item, order: order, item: item_3, price: 3, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)

order = create(:completed_order, user: user)
create(:fulfilled_order_item, order: order, item: item_1, price: 1, quantity: 1, created_at: rng.rand(4).days.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
