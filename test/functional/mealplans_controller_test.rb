require 'test_helper'

class MealplansControllerTest < ActionController::TestCase
  setup do
    @mealplan = mealplans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mealplans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mealplan" do
    assert_difference('Mealplan.count') do
      post :create, mealplan: { end: @mealplan.end, start: @mealplan.start }
    end

    assert_redirected_to mealplan_path(assigns(:mealplan))
  end

  test "should show mealplan" do
    get :show, id: @mealplan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mealplan
    assert_response :success
  end

  test "should update mealplan" do
    put :update, id: @mealplan, mealplan: { end: @mealplan.end, start: @mealplan.start }
    assert_redirected_to mealplan_path(assigns(:mealplan))
  end

  test "should destroy mealplan" do
    assert_difference('Mealplan.count', -1) do
      delete :destroy, id: @mealplan
    end

    assert_redirected_to mealplans_path
  end
end
