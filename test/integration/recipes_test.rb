require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: 'jen', email: 'jen@email.com')
    @recipe1 = Recipe.create(name: 'Meat Pile', description: 'Hamburger and spices', chef: @chef)
    @recipe2 = @chef.recipes.build(name: 'Eggs in a Cloud', 
      description: 'Separate eggs, putting whites in 1 large bowl and yolks in 4 separate small bowls. 
      Whip whites until stiff peaks form. Fold in cheese, chives and bacon. Spoon into 4 mounds on 
      parchment-lined baking sheet; make a deep well in center of each.')
    @recipe2.save
  end

  test 'should get recipes index page' do
    get recipes_path
    assert_response :success
  end

  test 'should get a list of recipes' do
    get recipes_path
    assert_template 'recipes/index'
    assert_select 'a[href=?]', recipe_path(@recipe1), text: @recipe1.name
    assert_select 'a[href=?]', recipe_path(@recipe2), text: @recipe2.name
  end

  test 'should get recipes show page' do
    get recipe_path(@recipe1)
    assert_response :success
    assert_template 'recipes/show'
    assert_match @recipe1.name, response.body
    assert_match @recipe1.description, response.body
    assert_match @chef.chefname, response.body
  end

  test 'create new, valid recipe' do
    get new_recipe_path
  end

  test 'reject invalid recipe submissions' do
    get new_recipe_path
  end
end
