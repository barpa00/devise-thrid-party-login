require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "基本功能" do
    it "可以購物了" do
      #AAA
      #arrange
      cart = Cart.new
      #act
      cart.add_item(1)
      #assert
      expect(cart.items.empty).to be false
    end

    it "加商品" do 
      cart = Cart.new
      3.times { cart.add_item(1) }
      3.times { cart.add_item(1) }
      expect(cart.items)
    end

end
