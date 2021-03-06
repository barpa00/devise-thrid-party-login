class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(product_id)
    # @items << product_id
    found_item = items.find { |item| item.product_id == product_id }

    if found_item
      found_item.increment
    else
      @items << CartItem.new(product_id)
    end

  end

  def empty?
    @items.empty?
  end

  # def total_price
  #   # total = 0
  #   # @items.each do |item|
  #   #   total = total + item.total_price
  #   # end
  #   # total
  #   items.reduce(0) { |sum, item| sum + item.price }
  # end

end