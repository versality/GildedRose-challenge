require_relative 'spec_helper'

describe GildedRose::ItemCollection do
  describe "#update_quality" do
    it "does not change the name" do
      items = [GildedRose::Item.new("foo", 0, 0)]
      GildedRose::ItemCollection.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end
end
