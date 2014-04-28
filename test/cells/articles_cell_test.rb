require 'test_helper'

class ArticlesCellTest < Cell::TestCase
  test "recent" do
    invoke :recent
    assert_select "p"
  end
  

end
