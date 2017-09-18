require 'test_helper'

class BreakdownsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @breakdown = breakdowns(:one)
  end

  test "should get index" do
    get breakdowns_url
    assert_response :success
  end

  test "should get new" do
    get new_breakdown_url
    assert_response :success
  end

  test "should create breakdown" do
    assert_difference('Breakdown.count') do
      post breakdowns_url, params: { breakdown: { account: @breakdown.account, amount: @breakdown.amount, content: @breakdown.content, currentBalance: @breakdown.currentBalance, date: @breakdown.date } }
    end

    assert_redirected_to breakdown_url(Breakdown.last)
  end

  test "should show breakdown" do
    get breakdown_url(@breakdown)
    assert_response :success
  end

  test "should get edit" do
    get edit_breakdown_url(@breakdown)
    assert_response :success
  end

  test "should update breakdown" do
    patch breakdown_url(@breakdown), params: { breakdown: { account: @breakdown.account, amount: @breakdown.amount, content: @breakdown.content, currentBalance: @breakdown.currentBalance, date: @breakdown.date } }
    assert_redirected_to breakdown_url(@breakdown)
  end

  test "should destroy breakdown" do
    assert_difference('Breakdown.count', -1) do
      delete breakdown_url(@breakdown)
    end

    assert_redirected_to breakdowns_url
  end
end
