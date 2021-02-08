# frozen_string_literal: true

require 'test_helper'

class ListitemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get listitems_index_url
    assert_response :success
  end

  test 'should get new' do
    get listitems_new_url
    assert_response :success
  end

  test 'should get create' do
    get listitems_create_url
    assert_response :success
  end

  test 'should get update' do
    get listitems_update_url
    assert_response :success
  end

  test 'should get edit' do
    get listitems_edit_url
    assert_response :success
  end

  test 'should get destroy' do
    get listitems_destroy_url
    assert_response :success
  end
end
