module GildedRose::ItemBehavior::UniqueItem
  class AgedBrie < ::GildedRose::ItemBehavior::Base
    def initialize(item)
      @item = item
    end

    def update_quality
      super
      
      change_quality(+1)
    end
  end
end