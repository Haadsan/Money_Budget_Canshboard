require("sinatra")
require("sinatra/contrib/all" ) if development?

require_relative("../models/transaction")
require_relative("../models/tag")
require_relative('../models/merchant.rb')

also_reload( '../models/*' )
require("pry-byebug")



get '/merchants/new' do
  @merchants = Merchant.all()
  erb(:"merchants/new")
end
