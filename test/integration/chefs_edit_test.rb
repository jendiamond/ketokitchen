require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: 'Jen', email: 'jen@email.com',
                         password: 'secretpswd', password_confirmation: 'secretpswd')
  end

  test "reject an invalid edit" do
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: {chefname: '', email: 'jen@email.com'}}
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

    test "accept a valid edit" do
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: {chefname: 'Jen D', email: 'jend@email.com'}}
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match 'Jen D', @chef.chefname
    assert_match 'jend@email.com', @chef.email
  end
end
