require_relative '../spec_helper'

describe GildedRose::ItemCollection do
  describe 'common item' do
    subject { 'common item' } 
    include_context 'quality modifier'
    include_examples 'item quality low cap', 'common item'
    include_examples 'item quality high cap', 'common item'
    include_examples 'item quality degradation', 'common item'

    it 'degrades in quality every day by 1' do
      quality = 20

      item = GildedRose::Item.new(name=subject, sell_in=10, quality=quality)
      item_collection = GildedRose::ItemCollection.new([item])
      item_collection.update_quality

      expect(item.quality).to eq(quality - default_quality_modifier)
    end
  end
end
