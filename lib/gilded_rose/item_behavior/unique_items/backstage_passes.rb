module GildedRose::ItemBehavior::UniqueItem
  class BackstagePassesToATafkal80etcConcert < ::GildedRose::ItemBehavior::Base
    def initialize(item)
      @item = item
    end

    def update_quality
      super

      if @item.sell_in <= 0
        @item.quality = 0
      elsif @item.sell_in <= 5
        change_quality(+3)
      elsif @item.sell_in <= 10
        change_quality(+2)
      else
        change_quality(+1)
      end
    end
  end
end