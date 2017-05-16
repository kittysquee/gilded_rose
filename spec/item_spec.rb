require 'item'

describe Item do
  describe "#to_s" do
    it 'should print out item with sellin and quality value' do
      item = Item.new("Aged Brie", 5, 5)
      expect(item.to_s).to eq "Aged Brie, 5, 5"
    end
  end
end
