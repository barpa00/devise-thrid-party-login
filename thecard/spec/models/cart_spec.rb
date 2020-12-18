require 'rails_helper'

RSpec.describe Cart, type: :model do

  describe "購物車基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do 
      cart = Cart.new
      cart.add_item(1)
      expect(cart.empty?).to be false
    end
    it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變" do
      cart = Cart.new
      3.times { cart.add_item(3) }
      5.times { cart.add_item(2) }
 
      expect(cart.items.length).to be 2
      expect(cart.items[0].quantity).to be 3
      expect(cart.items[1].quantity).to be 5
    
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      # cart = Cart.new
      # p1 = Product.create(title:"oooo")               
      # p2 = Product.create(title:"uuuuu")

      # 3.times { cart.add_item(1) }
      # 5.times { cart.add_item(2) }

      # expect(cart.items.first.product_id).to be p1.id  
      # expect(cart.items.second.product_id).to be p2.id 
      # expect(cart.items.first.product).to be_a Product 
 
    end

    # it "每個 Cart Item 都可以計算它自己的金額（小計）" 

    it "可以計算整台購物車的總消費金額" do
      # cart = Cart.new
      # p1 = Product.create(title:"oooo", price: 100)               
      # p2 = Product.create(title:"uuuuu", price: 150)
      
      # 2.times {
      #   cart.add_item(p1.id)
      #   cart.add_item(p2.id)
      # }
  
      # expect(cart.total_price).to be 500
      
    end
    it "特別活動可能可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百）"
  end
end
