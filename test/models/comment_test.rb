require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(chefname: "jen", email: "jen@email.com",
                         password:'secretpswd', password_confirmation: 'secretpswd')
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")
    @recipe.save
    @comment = Comment.create!(description: "Delicious & satisfying.", chef: @chef, recipe: @recipe)
  end

  test 'should be valid' do
    assert @comment.valid?
  end

  test 'comment should be valid' do
    @comment.description = ' '
    assert_not @comment.valid?
  end

  test 'comment should be less than 1501 characters' do
    @comment.description = 'A' * 1501
    assert_not @comment.valid?
  end

  test "comment without a recipe should be invalid" do
    @comment.recipe_id = nil
    assert_not @comment.valid?
  end

  test "comment without a chef should be invalid" do
    @comment.chef_id = nil
    assert_not @comment.valid?
  end
end
