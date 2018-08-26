RSpec.shared_examples 'item quality low cap' do |parameter|
  it 'never degrades in quality below 0' do
    item = GildedRose::Item.new(name=parameter, sell_in=0, quality=0)
    item_collection = GildedRose::ItemCollection.new([item])
    item_collection.update_quality

    expect(item.quality).to eq(0)
  end
end

RSpec.shared_examples 'item quality high cap' do |parameter|
  it 'cannot have quality higher than 50' do
    quality = 52

    item = GildedRose::Item.new(name=parameter, sell_in=20, quality=quality)
    item_collection = GildedRose::ItemCollection.new([item])
    item_collection.update_quality

    expect(item.quality).to eq(50)
  end
end

RSpec.shared_examples 'item quality degradation' do |parameter|
  it 'degrades quality twice as fast below sell_in' do
    quality = 10

    item = GildedRose::Item.new(name=parameter, sell_in=-20, quality=quality)
    item_collection = GildedRose::ItemCollection.new([item])
    item_collection.update_quality

    expect(item.quality).to eq(quality - default_quality_modifier * 2)
  end
end