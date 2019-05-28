require 'test_helper'

class DraftsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get drafts_create_url
    assert_response :success
  end

end
