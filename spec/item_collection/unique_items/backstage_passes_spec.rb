require_relative '../../spec_helper'

describe GildedRose::ItemCollection do
  describe 'Backstage passes to a TAFKAL80ETC concert' do
    subject { 'Backstage passes to a TAFKAL80ETC concert' }
    include_context 'quality modifier'
    include_examples 'item quality low cap', 'Conjured random item'
    include_examples 'item quality high cap', 'Conjured random item'

    it 'increases in quality before sell_in' do
      quality = 1

      item = GildedRose::Item.new(name=subject, sell_in=20, quality=quality)

      item_collection = GildedRose::ItemCollection.new([item])
      item_collection.update_quality

      expect(item.quality).to eq(quality + default_quality_modifier)
    end

    context 'sell_in 10 days or less' do
      let(:default_quality_modifier) { 2 }

      it 'increases in quality by 2' do
        quality = 1

        item = GildedRose::Item.new(name=subject, sell_in=10, quality=quality)

        item_collection = GildedRose::ItemCollection.new([item])
        item_collection.update_quality

        expect(item.quality).to eq(quality + default_quality_modifier)
      end
    end

    context 'sell_in 5 days or less' do
      let(:default_quality_modifier) { 3 }

      it 'increases in quality by 3' do
        quality = 1

        item = GildedRose::Item.new(name=subject, sell_in=5, quality=quality)

        item_collection = GildedRose::ItemCollection.new([item])
        item_collection.update_quality

        expect(item.quality).to eq(quality + default_quality_modifier)
      end
    end

    context 'sell_in 0' do
      it 'drops quality to 0' do
        quality = 20

        item = GildedRose::Item.new(name=subject, sell_in=0, quality=quality)

        item_collection = GildedRose::ItemCollection.new([item])
        item_collection.update_quality

        expect(item.quality).to eq(0)
      end
    end
  end
end
