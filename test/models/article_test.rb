require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "Should save a valid article" do
    article = Article.new
    article.name = "Some name"
    article.body = "Some body"
    article.preview = "Some preview"
    article.img_name = "Some image name"

    assert article.save, "Article saved successfully"
  end

  test "Should not save without an article title" do
    article = Article.new
    article.body = "Some body"
    article.preview = "Some preview"
    article.img_name = "Some image name"

    assert_not article.save, "Article saved without Name"
  end

  test "should generate a show after saving" do
    article = Article.new
    article.name = "Some name"
    article.body = "Some body"
    article.preview = "Some preview"
    article.img_name = "Some image name"

    article.save

    assert_not_empty article.show, "Article preview is empty"
  end
end
