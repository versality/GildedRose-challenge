module GildedRose::ItemBehavior
  class ItemBehavior
    def initialize(item)
      @item = item
      @database_item = GildedRose::DatabaseItem.search_by_name(item.name)
    end

    def update_quality
      delegate = delegate_behavior.new(@item, @database_item)
      delegate.update_quality
    end

    private
    def delegate_behavior
      delegate = @database_item.type.capitalize
      klass_string = "GildedRose::ItemBehavior::Type::#{delegate}"
      Object.const_get(klass_string)
    end
  end
end