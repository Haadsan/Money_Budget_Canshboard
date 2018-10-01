require("sinatra")
require("sinatra/contrib/all" )

require_relative("../models/transaction")
require_relative("../models/tag")
require_relative('../models/merchant.rb')

also_reload( '../models/*' )
require("pry-byebug")


# index
get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end
#
#show tags of all trasactional data
get '/tags/:id' do
  @tags = Tag.find(params['id'])
  erb(:"tags/show")
end
