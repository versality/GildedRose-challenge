require_relative '../spec_helper'

describe GildedRose::ItemCollection do
  describe 'conjured items' do
    subject { 'Conjured random item' }
    include_examples 'item quality low cap', 'Conjured random item'
    include_examples 'item quality high cap', 'Conjured random item'
    include_examples 'item quality degradation', 'Conjured random item'

    let(:default_quality_modifier) { 2 }

    it "decreases in quality twice as fast" do
      quality = 20

      item = GildedRose::Item.new(name=subject, sell_in=20, quality=quality)

      item_collection = GildedRose::ItemCollection.new([item])
      item_collection.update_quality

      expect(item.quality).to eq(quality - default_quality_modifier)
    end
  end
end
