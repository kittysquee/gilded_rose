class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in #days to sell item
    @quality = quality #item quality 
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
