require ('minitest/autorun')
require ('minitest/rg')

require_relative('../transaction.rb')

class TestTransaction < MiniTest::Test

  def setup
    @transaction = Transaction.new({"transaction_date" => "22-April-2018", "transaction_amount" => 50 , "id" => 1, "merchant_id" => 2, "tag_id" => 3  })
  end


  def test_transaction_has_date
    assert_equal("22-April-2018", @transaction.transaction_date)
  end


  def test_transaction_has_amount
    assert_equal(50, @transaction.transaction_amount)
  end

  def test_transaction_has_id
    assert_equal(1, @transaction.id)
  end

  def test_transaction_has_merchant_id
    assert_equal(2, @transaction.merchant_id)
  end

  def test_transaction_has_tag_id
    assert_equal(3, @transaction.tag_id)
  end

end
