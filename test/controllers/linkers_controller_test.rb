require 'test_helper'

class LinkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linker = linkers(:one)
  end

  test "should get index" do
    get linkers_url
    assert_response :success
  end

  test "should get new" do
    get new_linker_url
    assert_response :success
  end

  test "should create linker" do
    assert_difference('Linker.count') do
      post linkers_url, params: { linker: {  } }
    end

    assert_redirected_to linker_url(Linker.last)
  end

  test "should show linker" do
    get linker_url(@linker)
    assert_response :success
  end

  test "should get edit" do
    get edit_linker_url(@linker)
    assert_response :success
  end

  test "should update linker" do
    patch linker_url(@linker), params: { linker: {  } }
    assert_redirected_to linker_url(@linker)
  end

  test "should destroy linker" do
    assert_difference('Linker.count', -1) do
      delete linker_url(@linker)
    end

    assert_redirected_to linkers_url
  end
end
