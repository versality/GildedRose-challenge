require_relative '../spec_helper'

describe GildedRose::ItemCollection do
  subject { 'Sulfuras, Hand of Ragnaros' }

  describe 'legendary items' do
    it 'can only have quality of 80' do
      item = GildedRose::Item.new(name=subject, sell_in=20, quality=80)
      item_collection = GildedRose::ItemCollection.new([item])
      item_collection.update_quality

      expect(item.quality).to eq(80)
    end
  end
end
