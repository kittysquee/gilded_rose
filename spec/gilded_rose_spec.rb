require 'gilded_rose'

describe GildedRose do

  subject (:gilded_rose) { described_class.new }

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end

    # it "should have a maximum quality" do
    #   items = [Item.new("Aged Brie, 0, 50")]
    #   gilded_rose(items).update_quality()
    #   expect(items[0].quality::MAXIMUM_QUALITY).to eq 50
    # end

    context 'sulfuras' do
      it 'never has to be sold (sell in of 0)' do

      end

      it 'never decreases in quality' do

      end

      it 'has a quality of 80' do

      end
    end

    context 'aged brie' do
      it 'increases in quality as it gets older' do

      end

      it 'never has a quality over 50' do

      end

      it 'once sell in is 0, it\'s quality drops twice as quickly' do

      end
    end

    context 'backstage passes' do
      it 'increases in value as time passes' do

      end

      it 'when sellin is 10 or less, quality increases by 2' do

      end

      it 'when sellin is 5 or less, quality increases by 3' do

      end

      it 'when sellin is 0, quality is 0' do

      end
    end

    context 'conjured items' do
      it 'decreases in quality twice as quick (by 2 daily)' do

      end
    end

    context 'sell in' do
      it 'decreases by 1 every day' do
        
      end
    end
  end
end
