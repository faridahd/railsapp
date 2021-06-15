require "test_helper"

class ListitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listitem = listitems(:one)
  end

  test "should get index" do
    get listitems_url
    assert_response :success
  end

  test "should get new" do
    get new_listitem_url
    assert_response :success
  end

  test "should create listitem" do
    assert_difference('Listitem.count') do
      post listitems_url, params: { listitem: { item_count: @listitem.item_count, item_description: @listitem.item_description, item_name: @listitem.item_name } }
    end

    assert_redirected_to listitem_url(Listitem.last)
  end

  test "should show listitem" do
    get listitem_url(@listitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_listitem_url(@listitem)
    assert_response :success
  end

  test "should update listitem" do
    patch listitem_url(@listitem), params: { listitem: { item_count: @listitem.item_count, item_description: @listitem.item_description, item_name: @listitem.item_name } }
    assert_redirected_to listitem_url(@listitem)
  end

  test "should destroy listitem" do
    assert_difference('Listitem.count', -1) do
      delete listitem_url(@listitem)
    end

    assert_redirected_to listitems_url
  end
end
