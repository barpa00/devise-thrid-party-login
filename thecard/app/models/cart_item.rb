class CartItem

  # 商品預設有id跟數量為1
  # 數量 id 價錢
  attr_reader :product_id, :quantity

  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

  def increment(n = 1)
    @quantity += n
  end



  # def product
  #   Product.find(product_id)
  # end

  # def price
  #   product.price * quantity
  # end

end