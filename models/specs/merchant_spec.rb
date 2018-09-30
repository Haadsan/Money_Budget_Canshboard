require ('minitest/autorun')
require ('minitest/rg')

require_relative('../merchant.rb')

class TestMerchant < MiniTest::Test

  def setup
    @merchant = Merchant.new({"id" => 1 , "merchant_name" => "Tesco"})
  end

  def test_merchant_has_id
    assert_equal(1, @merchant.id)
  end

  def test_merchant_has_merchant_name
    assert_equal("Tesco", @merchant.merchant_name)

  end

end
