require("sinatra")
require("sinatra/contrib/all" ) if development?

require_relative("../models/transaction")
require_relative("../models/tag")
require_relative('../models/merchant.rb')

also_reload( '../models/*' )
require("pry-byebug")


get '/tags/new' do
  @tags = Tag.all()
  erb(:"tags/new")
end

post '/tags/new' do
  @tag = Tag.new(params)
  @tag.save()
  redirect to "/tags/new"
end
