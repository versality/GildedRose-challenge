require_relative '../../spec_helper'

describe GildedRose::ItemCollection do
  describe 'Aged Brie' do
    subject { 'Aged Brie' }
    include_context 'quality modifier'
    include_examples 'item quality high cap', 'Aged Brie'

    it 'increases in quality before sell_in' do
      quality = 1
      quality_increase = 1

      item = GildedRose::Item.new(name=subject, sell_in=20, quality=quality)

      item_collection = GildedRose::ItemCollection.new([item])
      item_collection.update_quality

      expect(item.quality).to eq(quality + quality_increase)
    end
  end
end


