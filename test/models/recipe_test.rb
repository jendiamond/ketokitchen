require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

def setup
  @chef = Chef.create!(chefname: "jen", email: "jen@email.com")
  @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")
end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end

  test "minimum length for description" do
    @recipe.description = "a" * 2
    assert_not @recipe.valid?
  end

 test "description shouldn't be less than 5 characters" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end

  test "maximum length for description" do
    @recipe.description = "a" * 1501
    assert_not @recipe.valid?
  end

  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
end
