
require_relative ("../models/merchant.rb")
require_relative ("../models/tag.rb")
require_relative ("../models/transaction.rb")
require("pry-byebug")

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()



merchant_1 = Merchant.new({"merchant_name" => "H&M"})
merchant_1.save

merchant_2 = Merchant.new({"merchant_name" => "Tesco"})
merchant_2.save

merchant_3 = Merchant.new({"merchant_name" => "Boots"})
merchant_3.save

tag_1 = Tag.new({"category" => "Clothes"})
tag_1.save

tag_2 = Tag.new({"category" => "Food"})
tag_2.save

tag_3 = Tag.new({"category" => "Health & Beauty"})
tag_3.save


transaction_1 = Transaction.new({
  "transaction_date" => "2018-09-29",
  "transaction_amount" => "100",
  "merchant_id" => merchant_1.id,
  "tag_id" => tag_1.id})
transaction_1.save

transaction_2 = Transaction.new({
  "transaction_date" => " 2018-09-30",
  "transaction_amount" => "80",
  "merchant_id" => merchant_2.id,
  "tag_id" => tag_2.id})
transaction_2.save

transaction_3 = Transaction.new({
  "transaction_date" => "2018-09-28",
  "transaction_amount" => "90",
  "merchant_id" => merchant_3.id,
  "tag_id" => tag_3.id})
transaction_3.save

transaction_4 = Transaction.new({
  "transaction_date" => "2018-09-27",
  "transaction_amount" => "50",
  "merchant_id" => merchant_1.id,
  "tag_id" => tag_1.id})
transaction_4.save


binding.pry
nil
