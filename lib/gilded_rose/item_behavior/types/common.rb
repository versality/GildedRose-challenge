module GildedRose::ItemBehavior::Type
  class Common < ::GildedRose::ItemBehavior::Base
    def update_quality
      super

      if @item.sell_in <= 0
        change_quality(-2)
      else
        change_quality(-1)
      end
    end
  end
end