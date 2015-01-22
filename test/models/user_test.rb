require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @one = users :one
  end

  test "user structure" do
    assert @one.respond_to? 'name'
    assert @one.respond_to? 'email'
    assert @one.respond_to? 'password_digest'
    assert @one.respond_to? 'password'
    assert @one.respond_to? 'password_confirmation'
    assert @one.respond_to? 'authenticate'
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
    valid_emails = %w[daniel@example.com ok.ok@gm.com 123.qqq@IL.com]
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

  def bad_user
    User.new(name: 'daniel',
                    email: 'valid@email.com',
                    password: '',
                    password_confirmation: 'hola123')
  end

  test "password is never empty" do
    user = bad_user
    assert user.invalid?
  end

  test "password is valid if its confirmation is the same" do
    user = bad_user
    user.password = 'hola123'
    assert user.invalid?
  end

  test "password is not too short" do
    user = bad_user
    user.password = 'a' * 3
    assert user.invalid?
  end
end
