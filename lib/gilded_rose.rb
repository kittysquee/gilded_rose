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

  def update_quality
    @items.each do |item|
      process_item(item)
    end
  end

  def process_item(item)
    quality_calculator(item)
    item.sell_in -= ITEM_INCREMENT_VALUE if item.name != SULFURAS
    if item.sell_in < 0
      if item.name != BRIE
        if item.name != BACKSTAGE_PASS
          decrease_quality(item) if item.name != SULFURAS
        else
          item.quality -= item.quality
        end
      else
        increase_quality(item)
      end
    end
  end

  def quality_calculator(item)
    if item.name != BRIE && item.name != BACKSTAGE_PASS
      decrease_quality(item) if item.name != SULFURAS
    else
      increase_quality(item)
      special_backstage_pass_check(item)
    end
  end

  def special_backstage_pass_check(item)
    return unless item.name == BACKSTAGE_PASS

    increase_quality(item) if item.sell_in < 11
    increase_quality(item) if item.sell_in < 6
  end

  def increase_quality(item)
    return unless item.quality < MAXIMUM_QUALITY
    item.quality += ITEM_INCREMENT_VALUE
  end

  def decrease_quality(item)
    return unless item.quality > MINIMUM_QUALITY
    item.quality -= ITEM_INCREMENT_VALUE
  end
end
