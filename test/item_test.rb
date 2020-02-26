require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test

  def test_it_exists
    item = Item.new({name: 'Peach', price: "$0.75"})

    assert_instance_of Item, item
  end

  def test_it_has_attribtes
    item = Item.new({name: 'Peach', price: "$0.75"})

    assert_equal 'Peach', item.name
    assert_equal 0.75, item.price
  end
end