# responsible for outputting information about an item
class Item
  attr_accessor :name, :sell_in, :quality # I would have an attr_reader and a private attr_writer if allowed

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in #days to sell item
    @quality = quality #item quality
  end

  def to_s() #I would delete these parens if I was allowed to change this class
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
