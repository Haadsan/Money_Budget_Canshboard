require("sinatra")
require("sinatra/contrib/all" ) if development?

require_relative("../models/transaction")
require_relative("../models/tag")
require_relative('../models/merchant.rb')

also_reload( '../models/*' )
require("pry-byebug")


get '/transactions' do
    @transactions = Transaction.all()
    @total = Transaction.total()
    @tags = Tag.all()
    @merchants = Merchant.all()
    erb(:"transactions/index")
  end

  
