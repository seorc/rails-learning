require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @one = users :one
  end

  test "user structure" do
    assert @one.respond_to? 'name'
    assert @one.respond_to? 'email'
  end

  test "the user has a name" do
    @one.name = ""
    assert @one.invalid?
    assert_equal ["can't be blank"], @one.errors[:name]
  end

  test "the user has an email" do
    @one.email = ""
    assert @one.invalid?
  end

  test "name must be short" do
    @one.name = "d" * 101
    assert @one.invalid?, "the name must be shorter than 100 chars"
  end

  test "mail structure" do
    valid_emails = %w[daniel@example.com ok.ok@gm.com 123.qqq@IL.com.mx]
    invalid_emails = %w[bad@bad@ok.com nope@do,com]

    valid_emails.each do |e|
      @one.email = e
      assert @one.valid?
    end

    invalid_emails.each do |e|
      @one.email = e
      assert @one.invalid?
    end
  end

  test "email is unique, even if it's upcased" do
    u = @one.dup  # Duplicates @one.
    u.email = @one.email.upcase
    assert u.invalid?
  end
end
