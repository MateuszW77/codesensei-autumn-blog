require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end

setup do
  @article = create :article
  @user = create :user
end

  test "GET #index shows articles" do
    get articles_path
    assert_response :success
    assert_includes(assigns[:articles], @article)
    assert_template 'index'
  end

  test 'POST #create when not signed in' do
    post articles_path, params: {
      article: {title: 'test title', text: 'texttexttext', terms_of_service: '1' }
    }
    assert_redirected_to new_user_session_path

  end

  test 'POST #create when signed in' do
  sign_in @user
  assert_difference 'Article.count', 1 do
    post articles_path, params: {
      article: {title: 'test title', text: 'texttexttext', terms_of_service: '1' }
    }
  end
  assert_redirected_to article_path(Article.last)
end
end
