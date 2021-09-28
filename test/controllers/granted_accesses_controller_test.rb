require "test_helper"

class GrantedAccessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @granted_access = granted_accesses(:one)
  end

  test "should get index" do
    get granted_accesses_url, as: :json
    assert_response :success
  end

  test "should create granted_access" do
    assert_difference('GrantedAccess.count') do
      post granted_accesses_url, params: { granted_access: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show granted_access" do
    get granted_access_url(@granted_access), as: :json
    assert_response :success
  end

  test "should update granted_access" do
    patch granted_access_url(@granted_access), params: { granted_access: {  } }, as: :json
    assert_response 200
  end

  test "should destroy granted_access" do
    assert_difference('GrantedAccess.count', -1) do
      delete granted_access_url(@granted_access), as: :json
    end

    assert_response 204
  end
end
