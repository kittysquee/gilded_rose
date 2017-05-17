require_relative 'item'

class GildedRose

  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  BRIE = "Aged Brie"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0
  ITEM_INCREMENT_VALUE = 1

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != BRIE && item.name != BACKSTAGE_PASS
        if item.quality > MINIMUM_QUALITY && item.name != SULFURAS
          item.quality -= ITEM_INCREMENT_VALUE
        end
      else
        if item.quality < MAXIMUM_QUALITY
          item.quality += ITEM_INCREMENT_VALUE
          if item.name == BACKSTAGE_PASS
            if item.sell_in < 11
              if item.quality < MAXIMUM_QUALITY && item.quality += ITEM_INCREMENT_VALUE
              end
            end
            if item.sell_in < 6
              if item.quality < MAXIMUM_QUALITY && item.quality += ITEM_INCREMENT_VALUE
              end
            end
          end
        end
      end
      if item.name != SULFURAS && item.sell_in -= ITEM_INCREMENT_VALUE
      end
      if item.sell_in < 0
        if item.name != BRIE
          if item.name != BACKSTAGE_PASS
            if item.quality > MINIMUM_QUALITY
              if item.name != SULFURAS && item.quality -= ITEM_INCREMENT_VALUE
              end
            end
          else
            item.quality -= item.quality
          end
        else
          if item.quality < MAXIMUM_QUALITY && item.quality += ITEM_INCREMENT_VALUE
          end
        end
      end
    end
  end
end
