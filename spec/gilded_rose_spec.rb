require 'gilded_rose'

describe GildedRose do

  # subject (:gilded_rose) { described_class.new }

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end

    context 'miscellaneous item' do
      it 'can decrease in quality' do
        items = [Item.new("apple", 5, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 4
      end
    end

    context 'quality' do
      it 'is never more than 50' do

      end

      it 'is never negative' do
        items = [Item.new("apple", 5, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to_not eq -1
      end
    end

    context 'sulfuras' do
      it 'never has to be sold' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 9, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
      end

      it 'never decreases in quality' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 9)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 9
      end
    end

    context 'aged brie' do
      it 'increases in quality as it gets older' do
        items = [Item.new("Aged Brie", 4, 8)]
        GildedRose.new(items).update_quality()

        expect(items[0].quality).to eq 9
      end

      it 'never has a quality over 50' do
        items = [Item.new("Aged Brie", 1, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to_not eq 51
      end

      # it 'once sell in is 0, it\'s quality drops twice as quickly' do
      #   items = [Item.new("Aged Brie", -1, 50)]
      #   GildedRose.new(items).update_quality()
      #   expect(items[0].quality).to eq 48
      # end
    end

    context 'backstage passes' do
      it 'increases in value as time passes' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 21
      end

      it 'when sellin is 10 or less, quality increases by 2' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 22
      end

      it 'when sellin is 5 or less, quality increases by 3' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 23
      end

      it 'should have maximum quality of 50' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end

      it 'when sellin is 0, quality is 0' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end

    # context 'conjured items' do
    #   it 'decreases in quality twice as quick (by 2 daily)' do
    #
    #   end
    # end
    #
    context 'sell in' do
      it 'decreases by 1 every day' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
      end
    end
  end
end
