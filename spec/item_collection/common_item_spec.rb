require_relative '../spec_helper'

describe GildedRose::ItemCollection do
  describe 'common item' do
    it 'degrades in quality every day by 1' do
      quality = 20

      item = GildedRose::Item.new(name='common item', sell_in=10, quality=quality)
      item_collection = GildedRose::ItemCollection.new([item])
      item_collection.update_quality

      expect(item.quality).to eq(quality-1)
    end

    it 'degrades in quality past sell_in by 2' do
      quality = 20

      item = GildedRose::Item.new(name='common item', sell_in=0, quality=quality)
      item_collection = GildedRose::ItemCollection.new([item])
      item_collection.update_quality

      expect(item.quality).to eq(quality-2)
    end

    it 'never degrades in quality below 0' do
      item = GildedRose::Item.new(name='common item', sell_in=0, quality=0)
      item_collection = GildedRose::ItemCollection.new([item])
      item_collection.update_quality

      expect(item.quality).to eq(0)
    end

    it 'cannot have quality higher than 50' do
      item = GildedRose::Item.new(name='common item', sell_in=20, quality=51)
      item_collection = GildedRose::ItemCollection.new([item])
      item_collection.update_quality

      expect(item.quality).to eq(50)
    end
  end
end
