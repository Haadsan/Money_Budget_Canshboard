require ('minitest/autorun')
require ('minitest/rg')

require_relative('../tag.rb')

class TestTag < MiniTest::Test

  def setup
    @tag = Tag.new({"id" => 1 , "category" => "clothes"})
  end


  def test_tag_has_id
    assert_equal(1, @tag.id)
  end

  def test_tag_has_tag_name
    assert_equal("clothes", @tag.category)
end

end
