require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "Jen", email: "jen@email.com")
  end

  test "should be valid" do
    assert @chef.valid?
  end

  test "chefname should be valid" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "chefname should be less than 30 characters" do
    @chef.chefname = "A" * 31
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "email should be less than 30 characters" do
    @chef.chefname = "A" * 31
    assert_not @chef.valid?
  end

  test "should accept correctly formated emails" do
    valid_emails = %w[user@example.com jen@gmail.com jen@yahoo.ca jen+diamond@co.uk.org]
    valid_emails.each do |valids|
      @chef.email = valids
      assert @chef.valid?, "#{valids.inspect} should be valid"
    end
  end

  test "should reject incorrectly formated email" do
    invalid_emails = %w[user@example jen@gmail,com jen@yahoo. jen@diamond+diamondorg]
    invalid_emails.each do |invalids|
      @chef.email = invalids
      assert_not @chef.valid?, "#{invalids.inspect} should NOT be valid"
    end
  end

  test "email should be unique and case insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end
end
