require("sinatra")
require("sinatra/contrib/all" )

require_relative("../models/tag")
require_relative('../models/merchant.rb')
require_relative("../models/transaction")
also_reload( '../models/*' )
require("pry-byebug")
