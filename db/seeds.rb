require 'factory_bot_rails'

include FactoryBot::Syntax::Methods

OrderItem.destroy_all
Order.destroy_all
Item.destroy_all
User.destroy_all

admin = create(:admin)
user = create(:user)
user_2 = create(:user, city: 'Denver', state: 'CO')
user_3 = create(:user, city: 'NYC', state: 'NY')
user_4 = create(:user, city: 'Seattle', state: 'WA')
user_5 = create(:user, city: 'Seattle', state: 'FL')

merchant_1 = create(:merchant)

merchant_2, merchant_3, merchant_4, merchant_5, merchant_6, merchant_7, merchant_8, merchant_9,
merchant_10, merchant_11, merchant_12, merchant_13, merchant_14, merchant_15 = create_list(:merchant, 15)

merchant_16 = create(:user, email: 'aaron@gmail.com', password: '1234', role: 1, name: 'Aaron', address: '123 Main St', city: 'Boston', state: 'MA', zip: '12345')

inactive_merchant_1 = create(:inactive_merchant)
inactive_user_1 = create(:inactive_user)

item_1 = create(:item, name: "bees case", image: "https://hips.hearstapps.com/elleuk.cdnds.net/16/48/skinnydip-bees.jpg?crop=1.0xw:1xh;center,top&resize=480:*", user: merchant_1)
item_2 = create(:item, name: "eat pasta case", image: "https://cdn.shopify.com/s/files/1/0694/6735/products/eat-pasta_900x.jpg?v=1527131001", user: merchant_2)
item_3 = create(:item, name: "get your own case", image: "https://cdn.shopify.com/s/files/1/0770/1091/products/thou-shalt-get-her-own-money-phone-case_66d6f59c-8edc-494b-9196-4c1cfcfec5cc_1024x1024.jpg?v=1486139439", user: merchant_3)
item_4 = create(:item, name: "wooden case", image: "https://www.carved.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/e/se-tc1s_face.jpg", user: merchant_4)
item_5 = create(:item, name: "easy pickin's case", image: "https://www.fashionstylegears.com/wp-content/uploads/2018/07/nose-iphone-case-1.jpg", user: merchant_5)
item_6 = create(:item, name: "so many books case", image: "https://images.girlslife.com/posts/034/34246/case_1.0.png", user: merchant_6)
item_7 = create(:item, name: "stay weird case", image: "https://i.pinimg.com/originals/4d/71/f8/4d71f81a9b00ce3aed3d1a672ab4f002.jpg", user: merchant_7)
item_8 = create(:item, name: "smile more case", image: "https://cdn.shopify.com/s/files/1/0275/6675/products/smile_sb_2048x2048.jpg?v=1519236752", user: merchant_8)
item_9 = create(:item, name: "a lil bougie case", image: "https://cdn.shopify.com/s/files/1/0770/1091/products/a-lil-bougie-phone-case_8068036f-43f0-4eaa-aefe-533306f029b9_800x.jpg?v=1486139325", user: merchant_9)
item_10 = create(:item, name: "delicate flower case", image: "http://cdn.shopify.com/s/files/1/0407/7113/products/phone3_grande.jpg?v=1517417496", user: merchant_10)
item_11 = create(:item, name: "fatigue case", image: "https://cdn.shopify.com/s/files/1/0687/4327/files/camo_main.JPG?15321166250517783543", user: merchant_11)
item_12 = create(:item, name: "black grid case", image: "https://www.magpul.com/Files/Files/Images/Products/ElectronicsCases/MAG849/Gallery/BLK/MAG849-BLK.png?format=jpg&width=400&height=400&bgcolor=F5F5F5", user: merchant_12)
item_13 = create(:item, name: "marble case", image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTug2_yXRYs9GzM8rwA-ccuqyCTd8Suk9N7iQ-QNM7-hmJoRMdo7b4jmVL6sQJW7FvedmXns1ENR8yasuzS55d-uChDh54iBwYeUl0zPfyp6-ukZ-R6Rtm0&usqp=CAE", user: merchant_13)
item_14 = create(:item, name: "yellow flower case", image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRRFSEqKe8T21vYuoLQW8MGbsS3a2-hmhxPNkHa7M6GZtkeZeontfug2GQlOs_FF_TIrA8Eqqzo4OYsgR5IkT3L_inQ57PK-WrtcJTrMrX4x5TWSp3ciVpV&usqp=CAE", user: merchant_14)
item_15 = create(:item, name: "blue marble case", image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQVvFq5xLNxxswdipMI9T_sQJKd4SdwS9cI112WdO0s0dAZXRAs29HXvQDxb31gdUGZV84ap11PrvM64IJV3LZ7unLTJQi_5JCV7y-qgaRiHPKM4SL_Co3e&usqp=CAE", user: merchant_1)
item_16 = create(:item, name: "liquid green case", image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQkYXsj7uYr6dAHfzgGID9gfQzF91pIvgSMLF9baaTT_R8YpJ4Ol0DJs9nh0cpdtkb9G_pGK_yy-yF28-N-tWNdeCboVt__H4HnO74koqkchzN72VugwE4EFw&usqp=CAE", user: merchant_2)
item_17 = create(:item, name: "checkered case", image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR7VKlU1MHf8g49rXv1k7Hfx7nFr8NALOmGniG86H4iBp4CJNLAOJJVEaIF1Zu-oRnGF10TadtG8yxoWrfkv2cZCiLoEepGm8Ut6wrvnBT4E1BhMI606-ShhQ&usqp=CAE", user: merchant_3)
item_18 = create(:item, name: "peace case", image: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcROsfz-ARDOwh-g-IUWFEd37h-hgONnhT7NvpQ1uTmOsy591PKXnF9g_Dg5ukggpXIa_DeauCpsgoMDBnO9KxbpE4SjiFu-WepXjRpTU41Sud-15GRQEDPb&usqp=CAE", user: merchant_4)
item_19 = create(:item, name: "rockish case", image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTvUA6Bs0URZCtMdMeGoyMuxGJX4IRQ_YBqUeywgKwR2CtCgwgMhooCCWQ_THVnBiZwvT38PCghdqDn5AXDZrSqe57J3EgR3ZQfE5ex8l7WL0WZEFxkmhZEdw&usqp=CAE", user: merchant_4)
item_20 = create(:item, name: "plain black case", image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRNCIJLqEENT-3bChgQRdxjEd4yzjB2dmzvmxoyNH-9iZk8sv_2PsekKMGyR6LRBKZi_dOoavgqe9DNb5q1KRQg4YkFZ3Sll1saVVEx8JDTbzl3iGu7BIhda3A&usqp=CAY", user: merchant_6)
item_21 = create(:item, name: "skull guy case", image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRzPO0AAzOAntfmkB2X91QDTmjNT5BT0YnbVULlraRd6Fef0Kg_cNN5LHFWlVNkgB-xnru4imgw4u8KcrCog-2ASHBwuhGVcKyB_aoLcdAo-cAvOVwH_sVuRw&usqp=CAE", user: merchant_6)
item_22 = create(:item, name: "terrified case", image: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQs6PteFHR1NpZbmupuJsmM0YZlss5rilkJfSRwoNQ0XDIYWGqGa6gAjpNOzPYzGzY_VLLyazoGMN-bAujMPhQ4cMkodgojBhGG6g0gzlVYTMnCuaU6n-Lg&usqp=CAE", user: merchant_5)
item_23 = create(:item, name: "nightmare before case", image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTCDBGYE17bWh097ZyZDM6ZcKHb8TofwFksvyK95eBR2HajKW1varqOUwhqn6R3LztfIfXteDav-9-jifWCJ0xa-M7YpqTa4FQgzDAvAkZovt0OE_V1xvAq&usqp=CAE", user: merchant_7)
item_24 = create(:item, name: "terrified again case", image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRWl8QW2qqWQBECOhoc-IuQblgVAMLWvhUtNxrVboSHGNJt8TbUXP-21qn_e8GVQjola04l0zjzFoKXtUvFoBDRfr_1prBF71Ea3bpj2_EZ_mb5dgPzsPL1og&usqp=CAE", user: merchant_10)
# create_list(:item, 10, user: merchant_1)

inactive_item_1 = create(:inactive_item, user: merchant_1)
inactive_item_2 = create(:inactive_item, user: inactive_merchant_1)

Random.new_seed
rng = Random.new

order_1 = create(:completed_order, user: user_2)
create(:fulfilled_order_item, order: order_1, item: item_1, price: 1, quantity: 1, created_at: 1.month.ago, updated_at: 10.days.ago)
create(:fulfilled_order_item, order: order_1, item: item_2, price: 2, quantity: 1, created_at: 1.month.ago, updated_at: 10.days.ago)
create(:fulfilled_order_item, order: order_1, item: item_3, price: 3, quantity: 1, created_at: 1.month.ago, updated_at: 10.days.ago)
create(:fulfilled_order_item, order: order_1, item: item_4, price: 4, quantity: 1, created_at: 1.month.ago, updated_at: 10.days.ago)
create(:review, item: item_3, user: user_2)

order_2 = create(:completed_order, user: user_2)
create(:fulfilled_order_item, order: order_2, item: item_8, price: 1, quantity: 1, created_at: 1.month.ago, updated_at: 10.days.ago)
create(:fulfilled_order_item, order: order_2, item: item_9, price: 2, quantity: 1, created_at: 1.month.ago, updated_at: 10.days.ago)
create(:fulfilled_order_item, order: order_2, item: item_10, price: 3, quantity: 1, created_at: 1.month.ago, updated_at: 10.days.ago)
create(:fulfilled_order_item, order: order_2, item: item_11, price: 4, quantity: 1, created_at: 1.month.ago, updated_at: 10.days.ago)
create(:review, item: item_10, user: user_2)

order_3 = create(:completed_order, user: user_3)
create(:fulfilled_order_item, order: order_3, item: item_12, price: 1, quantity: 1, created_at: 4.days.ago, updated_at: 1.day.ago)
create(:fulfilled_order_item, order: order_3, item: item_14, price: 2, quantity: 1, created_at: 3.days.ago, updated_at: 1.day.ago)
create(:fulfilled_order_item, order: order_3, item: item_13, price: 3, quantity: 1, created_at: 2.days.ago, updated_at: 1.day.ago)
create(:fulfilled_order_item, order: order_3, item: item_15, price: 4, quantity: 1, created_at: 1.day.ago, updated_at: 1.day.ago)
create(:review, item: item_12, user: user_3)
create(:review, item: item_13, user: user_3)

order_4 = create(:completed_order, user: user_4)
create(:fulfilled_order_item, order: order_4, item: item_16, price: 1, quantity: 1, created_at: 4.days.ago, updated_at: 1.day.ago)
create(:fulfilled_order_item, order: order_4, item: item_17, price: 2, quantity: 1, created_at: 3.days.ago, updated_at: 1.day.ago)
create(:fulfilled_order_item, order: order_4, item: item_18, price: 3, quantity: 1, created_at: 2.days.ago, updated_at: 1.day.ago)
create(:fulfilled_order_item, order: order_4, item: item_19, price: 4, quantity: 1, created_at: 1.day.ago, updated_at: 1.day.ago)
create(:review, item: item_17, user: user_4)
create(:review, item: item_19, user: user_4)

order = create(:completed_order, user: user)
create(:fulfilled_order_item, order: order, item: item_1, price: 1, quantity: 1, created_at: rng.rand(3).days.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_3, price: 3, quantity: 1, created_at: rng.rand(5).days.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_4, price: 4, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
create(:review, item: item_2, user: user)
create(:review, item: item_4, user: user)

order = create(:order, user: user)
create(:order_item, order: order, item: item_1, price: 1, quantity: 1)
create(:fulfilled_order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).days.ago, updated_at: rng.rand(23).hours.ago)
create(:review, item: item_1, user: user)
create(:review, item: item_2, user: user)

order = create(:cancelled_order, user: user)
create(:order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
create(:order_item, order: order, item: item_3, price: 3, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
create(:review, item: item_2, user: user)
create(:review, item: item_3, user: user)

order = create(:completed_order, user: user)
create(:fulfilled_order_item, order: order, item: item_1, price: 1, quantity: 1, created_at: rng.rand(4).days.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
create(:review, item: item_1, user: user)
create(:review, item: item_2, user: user)

create_list(:review, 10)
