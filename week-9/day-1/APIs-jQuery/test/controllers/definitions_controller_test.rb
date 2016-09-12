require 'test_helper'

class DefinitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show_def" do
    get definitions_show_def_url
    assert_response :success
  end

end
