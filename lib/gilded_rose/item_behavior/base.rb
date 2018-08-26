module GildedRose::ItemBehavior
  class Base
    def initialize(item, database_item)
      @item = item
      @database_item = database_item
    end

    protected
    def update_quality
      return if @item.quality > 50
    end

    def change_quality(modifier)
      if @item.quality + modifier < 0
        @item.quality = 0
        return
      end

      if @item.quality + modifier > 50
        @item.quality = 50
        return
      end
      
      @item.quality += modifier
    end
  end
end