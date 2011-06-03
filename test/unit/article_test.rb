require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_title_required
    article = articles(:one)
    assert !article.save, "User not saved."
  end
end
