require_relative 'item'

class GildedRose

  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  BRIE = "Aged Brie"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != BRIE and item.name != BACKSTAGE_PASS
        if item.quality > MINIMUM_QUALITY
          if item.name != SULFURAS
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < MAXIMUM_QUALITY
          item.quality = item.quality + 1
          if item.name == BACKSTAGE_PASS
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < MAXIMUM_QUALITY
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != SULFURAS
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != BRIE
          if item.name != BACKSTAGE_PASS
            if item.quality > MINIMUM_QUALITY
              if item.name != SULFURAS
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < MAXIMUM_QUALITY
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
