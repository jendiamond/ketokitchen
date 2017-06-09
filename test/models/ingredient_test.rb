require 'test_helper'

class IngredientTest < ActiveSupport::TestCase

  def setup
    @ingredient1 = Ingredient.new(name: 'egg')
    @ingredient2 = Ingredient.new(name: '')
    @ingredient3 = Ingredient.new(name: 'egg')
  end

  test 'should be valid' do
    assert @ingredient1.valid?
  end

  test 'ingredient name should be valid' do
    assert_not @ingredient2.valid?
  end

  test 'ingredient should be present' do
    assert_not @ingredient2.valid?
  end

  test 'ingredient should be unique' do
#    assert_not @ingredient3.valid?
  end

end
