require_relative '../spec_helper'

describe GildedRose::ItemCollection do
  describe 'unique items' do
    context 'Aged Brie' do
      it 'increases in quality before sell_in' do
        quality = 1
        quality_increase = 1

        item = GildedRose::Item.new(name='Aged Brie', sell_in=20, quality=quality)

        item_collection = GildedRose::ItemCollection.new([item])
        item_collection.update_quality

        expect(item.quality).to eq(quality + quality_increase)
      end
    end

    context 'Backstage passes to a TAFKAL80ETC concert' do
      it 'increases in quality before sell_in' do
        quality = 1
        quality_increase = 1

        item = GildedRose::Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=20, quality=quality)

        item_collection = GildedRose::ItemCollection.new([item])
        item_collection.update_quality

        expect(item.quality).to eq(quality + quality_increase)
      end

      context 'sell_in 10 days or less' do
        it 'increases in quality by 2' do
          quality = 1
          quality_increase = 2

          item = GildedRose::Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=10, quality=quality)

          item_collection = GildedRose::ItemCollection.new([item])
          item_collection.update_quality

          expect(item.quality).to eq(quality + quality_increase)
        end
      end

      context 'sell_in 5 days or less' do
        it 'increases in quality by 3' do
          quality = 1
          quality_increase = 3

          item = GildedRose::Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=4, quality=quality)

          item_collection = GildedRose::ItemCollection.new([item])
          item_collection.update_quality

          expect(item.quality).to eq(quality + quality_increase)
        end
      end

      context 'sell_in 0' do
        it 'drops quality to 0' do
          quality = 20

          item = GildedRose::Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=0, quality=quality)

          item_collection = GildedRose::ItemCollection.new([item])
          item_collection.update_quality

          expect(item.quality).to eq(0)
        end
      end
    end

    context 'Conjured' do
      it 'decreases in quality by 2 before sell_in' do
        quality = 20
        quality_decrease = 2

        item = GildedRose::Item.new(name='Conjured random item', sell_in=20, quality=quality)

        item_collection = GildedRose::ItemCollection.new([item])
        item_collection.update_quality

        expect(item.quality).to eq(quality - quality_decrease)
      end
    end
  end
end
