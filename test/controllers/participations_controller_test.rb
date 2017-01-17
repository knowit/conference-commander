require 'test_helper'

class ParticipationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participation = participations(:one)
  end

  test "should get index" do
    get participations_url
    assert_response :success
  end

  test "should get new" do
    get new_participation_url
    assert_response :success
  end

  test "should create participation" do
    assert_difference('Participation.count') do
      post participations_url, params: { participation: {  } }
    end

    assert_redirected_to participation_url(Participation.last)
  end

  test "should show participation" do
    get participation_url(@participation)
    assert_response :success
  end

  test "should get edit" do
    get edit_participation_url(@participation)
    assert_response :success
  end

  test "should update participation" do
    patch participation_url(@participation), params: { participation: {  } }
    assert_redirected_to participation_url(@participation)
  end

  test "should destroy participation" do
    assert_difference('Participation.count', -1) do
      delete participation_url(@participation)
    end

    assert_redirected_to participations_url
  end
end
