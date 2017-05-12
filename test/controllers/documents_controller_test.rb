require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
    
    @user = users(:jdoe)
  end

  test "should get index" do
    get documents_url
    assert_response :success
  end

  test "should get new" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    get new_document_url
    assert_response :success
    delete logout_path
    assert_not is_logged_in?
  end

  test "should create document" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_difference('Document.count') do
      post documents_url, params: { document: { project_id: @document.project_id } }
    end

    assert_redirected_to document_url(Document.last)
    delete logout_path
    assert_not is_logged_in?
  end

  test "should show document" do
    get document_url(@document)
    assert_response :success
  end

  test "should get edit" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    get edit_document_url(@document)
    assert_response :success
    delete logout_path
    assert_not is_logged_in?
  end

  test "should update document" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    patch document_url(@document), params: { document: { project_id: @document.project_id } }
    assert_redirected_to document_url(@document)
    delete logout_path
    assert_not is_logged_in?
  end

  test "should destroy document" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_difference('Document.count', -1) do
      delete document_url(@document)
    end

    assert_redirected_to documents_url
    delete logout_path
    assert_not is_logged_in?
  end
end
