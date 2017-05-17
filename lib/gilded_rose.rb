require_relative 'item'

class GildedRose

  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  BRIE = "Aged Brie"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  ITEM_CHANGE_VALUE = 1

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      process_item(item)
    end
  end

  def process_item(item)
    item.sell_in -= ITEM_CHANGE_VALUE if item.name != SULFURAS
    quality_calculator(item)
    special_backstage_pass_check(item)
    return unless item.sell_in < 0
    if item.name == BRIE
      increase_quality(item)
    else
      decrease_quality(item)
    end
  end

  def quality_calculator(item)
    if item.name == BRIE || item.name == BACKSTAGE_PASS
      increase_quality(item)
    else
      decrease_quality(item)
    end
  end

  def special_backstage_pass_check(item)
    return unless item.name == BACKSTAGE_PASS

    increase_quality(item) if item.sell_in < 11
    increase_quality(item) if item.sell_in < 6
    item.quality -= item.quality if item.sell_in < 0
  end

  def increase_quality(item)
    return unless item.quality < 50
    return unless item.name != SULFURAS

    item.quality += ITEM_CHANGE_VALUE
  end

  def decrease_quality(item)
    return unless item.quality > 0
    return unless item.name != SULFURAS
    return unless item.name != BACKSTAGE_PASS

    if item.name == "Conjured Item"
      item.quality -= ITEM_CHANGE_VALUE
    end
    item.quality -= ITEM_CHANGE_VALUE
  end
end
