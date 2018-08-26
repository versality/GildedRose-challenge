module GildedRose::ItemBehavior::Type
  class Unique < ::GildedRose::ItemBehavior::Base
    def update_quality
      super

      delegate = delegate_behavior.new(@item)
      delegate.update_quality
    end

    private
    def delegate_behavior
      delegate = @database_item.name.split(' ').map(&:capitalize).join
      klass_string = "GildedRose::ItemBehavior::UniqueItem::#{delegate}"
      Object.const_get(klass_string)
    end
  end
end