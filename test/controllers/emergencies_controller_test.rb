require 'test_helper'

class EmergenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emergency = emergencies(:one)
  end

  test "should get index" do
    get emergencies_url
    assert_response :success
  end

  test "should get new" do
    get new_emergency_url
    assert_response :success
  end

  test "should create emergency" do
    assert_difference('Emergency.count') do
      post emergencies_url, params: { emergency: { address: @emergency.address, client_id: @emergency.client_id, description: @emergency.description, latitude: @emergency.latitude, longitude: @emergency.longitude } }
    end

    assert_redirected_to emergency_url(Emergency.last)
  end

  test "should show emergency" do
    get emergency_url(@emergency)
    assert_response :success
  end

  test "should get edit" do
    get edit_emergency_url(@emergency)
    assert_response :success
  end

  test "should update emergency" do
    patch emergency_url(@emergency), params: { emergency: { address: @emergency.address, client_id: @emergency.client_id, description: @emergency.description, latitude: @emergency.latitude, longitude: @emergency.longitude } }
    assert_redirected_to emergency_url(@emergency)
  end

  test "should destroy emergency" do
    assert_difference('Emergency.count', -1) do
      delete emergency_url(@emergency)
    end

    assert_redirected_to emergencies_url
  end
end
