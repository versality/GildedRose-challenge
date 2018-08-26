module GildedRose::ItemBehavior::Type
  class Conjured < ::GildedRose::ItemBehavior::Base
    def update_quality
      super
      
      if @item.sell_in <= 0
        change_quality(-4)
      else
        change_quality(-2)
      end
    end
  end
end