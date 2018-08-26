module GildedRose
  class ItemCollection
    def initialize(items)
      @items = items
    end

    def update_quality
      @items.each do |item|
        item_behavior = ItemBehavior::ItemBehavior.new(item)
        item_behavior.update_quality
      end
    end
  end
end