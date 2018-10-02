require("sinatra")
require("sinatra/contrib/all" ) if development?

require_relative("../models/transaction")
require_relative("../models/tag")
require_relative('../models/merchant.rb')

also_reload( '../models/*' )
require("pry-byebug")


get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

get "/tags/:id/edit" do
  @tag = Tag.find(params[:id])
  erb(:"tags/edit")
end

get '/tags/new' do
  erb(:"tags/new")
end

get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb( :"tags/show" )
end


post "/tags" do
  @tag = Tag.new(params)
  @tag.save()
  erb(:"tags/create")
end

post "/tags/:id" do
  @tag = Tag.new(params)
  @tag.update()
  redirect to("/tags")
end

post '/tags/:id/delete' do
  @tag = Tag.find(params[:id])
  @tag.delete()
  redirect '/tags'
end
