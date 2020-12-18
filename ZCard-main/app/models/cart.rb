class Cart 

  def initialize
    @items = []
  end

  def add_item(item_id)
    # @item = []
    found_item  = @items.find {|item| item.item_id == item_id }

    if found_item
      found_item.increment
    else
      @items << CartItem.new(item_id)
    end
    @items << item_id
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end


end
