require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: 'jen', email: 'jen@email.com',
                         password:'secretpswd', password_confirmation: 'secretpswd')
    @recipe = Recipe.create(name: 'Meat Pile', description: 'Hamburger and spices', chef: @chef)
    @comment = Comment.create!(description: "This doesn't taste ike bread but it is delicious, satisfying and filling.", chef: chef, recipe: recipe)




 # recipe.comments

 # chef.comments

 # comment.chef

 # comment.chef.chefname

 # comment = recipe.comments.build(description: "Another excellent recipe", chef: chef)

 # comment.save

 # recipe = Recipe.first


  end
=begin
  test 'should get recipes/index page' do
    get recipes_path
    assert_response :success
  end

  test 'should get a list of recipes' do
    get recipes_path
    assert_template 'recipes/index'
    assert_select 'a[href=?]', recipe_path(@recipe), text: @recipe.name
    assert_select 'a[href=?]', recipe_path(@recipe2), text: @recipe2.name
  end

  test 'should get recipes/show page' do
    sign_in_as(@chef, 'secretpswd')
    get recipe_path(@recipe)
    assert_response :success
    assert_template 'recipes/show'
    assert_match @recipe.name, response.body
    assert_match @recipe.description, response.body
    assert_match @chef.chefname, response.body
    assert_select 'a[href=?]', edit_recipe_path(@recipe), text: 'Edit'
    assert_select 'a[href=?]', recipe_path(@recipe), text: 'Delete'
    assert_select 'a[href=?]', chef_path(@recipe.chef), text: 'View your profile'
  end

  test 'create new, valid recipe' do
    sign_in_as(@chef, 'secretpswd')
    get new_recipe_path
    assert_template 'recipes/new'
    name_of_recipe = 'Choki'
    description_of_recipe = 'Cocoa, butter, vanilla, artificial sweetner, mct oil'
    assert_difference 'Recipe.count', 1 do
      post recipes_path, params: { recipe: { name: name_of_recipe, description: description_of_recipe }}
    end
    follow_redirect!
    assert_match name_of_recipe.capitalize, response.body
    assert_match description_of_recipe, response.body
  end

  test 'reject invalid recipe submissions' do
    sign_in_as(@chef, 'secretpswd')
    get new_recipe_path
    assert_template 'recipes/new'
    assert_no_difference 'Recipe.count' do
      post recipes_path, params: { recipe: { name: " ", description: " " } }
    end
    assert_template 'recipes/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
=end
end
