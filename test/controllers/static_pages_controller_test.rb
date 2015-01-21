require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @app_title = "Sample Application"
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get about" do
    get :about
	assert_response :success
  end

  test "should get contact" do
    get :contact
	assert_response :success
  end

  test "should have the no title" do
	  get :home
	  assert_select "title", "#{@app_title}"
  end

  test "should have title 'help'" do
	  get :help
	  assert_select "title", "#{@app_title} | Help"
  end

  test "should have title 'about'" do
	  get :about
	  assert_select "title", "#{@app_title} | About"
  end

  test "should have title 'contact'" do
	  get :contact
	  assert_select "title", "#{@app_title} | Contact"
  end
end
