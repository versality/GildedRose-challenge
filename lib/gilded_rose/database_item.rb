# Fake database item to represent list of items

module GildedRose
  class DatabaseItem
    Item = Struct.new(:name, :type)

    ITEMS = {
      'Aged Brie' => {
        type: :unique
      },

      'Sulfuras, Hand of Ragnaros' => {
        type: :legendary
      },

      'Backstage passes to a TAFKAL80ETC concert' => {
        type: :unique
      },
    }

    def self.search_by_name(name)
      return Item.new(name, :conjured) if self.conjured?(name)
      item = ITEMS[name]
      return Item.new(name, :common) unless item
      Item.new(name, item[:type])
    end

    def self.conjured?(name)
      /^Conjured\s+/i.match?(name)
    end
  end
end
