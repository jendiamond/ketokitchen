require 'test_helper'

class IngredientsTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: 'jen', email: 'jen@email.com',
                         password:'secretpswd', password_confirmation: 'secretpswd')
    @recipe = Recipe.create!(name: 'Meat Pile', description: 'Hamburger and spices', chef: @chef)
    @ingredient = Ingredient.create!(name:'bacon')
    @ingredient2 = Ingredient.create!(name:'hamburger')
  end

  test 'should get ingredients/index page' do
    get ingredients_path
    assert_response :success
  end

  test 'should get a list of ingredients' do
    get ingredients_path
    assert_template 'ingredients/index'
    assert_select 'a[href=?]', ingredient_path(@ingredient), text: @ingredient.name.capitalize
    assert_select 'a[href=?]', ingredient_path(@ingredient2), text: @ingredient2.name.capitalize
  end

  test 'should get ingredients/show page' do
    get ingredient_path(@ingredient)
    assert_template 'ingredients/show'
    assert_match @ingredient.name, response.body
  end



=begin

  test 'create new, valid recipe' do
    get new_ingredient_path
    assert_template 'ingredients/new'
    name_of_ingredient = 'Chocolate'
    assert_difference 'Ingredient.count', 1 do
      post ingredients_path, params: { ingredient: { name: name_of_ingredient }}
    end
    follow_redirect!
    assert_match name_of_ingredient.capitalize, response.body
  end

  test 'reject invalid recipe submissions' do
    get new_ingredient_path
    assert_template 'ingredients/new'
    assert_no_difference 'Ingredient.count' do
      post ingredients_path, params: { ingredient: { name: " " } }
    end
    assert_template 'ingredients/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

=end
end
