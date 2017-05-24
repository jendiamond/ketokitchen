require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: 'jen', email: 'jen@email.com',
                        password: 'password', 
                            password_confirmation: 'password')
    @chef2 = Chef.create!(chefname: 'john', email: 'john@email.com',
                        password: 'password', password_confirmation: 'password')
    @admin_user = Chef.create!(chefname: 'john1', email: 'john1@email.com',
                        password: 'password', password_confirmation: 'password', admin: true)
  end

  test 'reject an invalid edit' do
    sign_in_as(@chef, 'password')
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: {chefname: '', email: 'jen@email.com'}}
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test 'accept a valid edit' do
    sign_in_as(@chef, 'password')
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: {chefname: 'Jen D', email: 'jend@email.com'}}
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match 'Jen D', @chef.chefname
    assert_match 'jend@email.com', @chef.email
  end

  test 'accept edit attempt by an admin user' do
    sign_in_as(@admin_user, 'password')
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: {chefname: 'Jen L D', email: 'jenld@email.com'}}
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match 'Jen L D', @chef.chefname
    assert_match 'jenld@email.com', @chef.email
  end

  test 'redirect edit attempt by another non-admin user' do
    sign_in_as(@chef2, 'password')
    updated_name = 'jen jen'
    updated_email = 'jenjen@email.com'
    patch chef_path(@chef), params: { chef: { chefname: updated_name, email: updated_email } }
    assert_redirected_to chefs_path
    assert_not flash.empty?
    @chef.reload
    assert_match 'jen', @chef.chefname
    assert_match 'jen@email.com', @chef.email
  end

end
