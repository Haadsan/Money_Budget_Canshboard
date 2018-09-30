require("sinatra")
require("sinatra/contrib/all" )

require_relative("../models/tag")
also_reload( '../models/*' )
require("pry-byebug")

# index
get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

#show
get '/tags/:id' do
  @transactions = Transaction.all()
  @tag = Tag.find(params['id'].to_i)
  erb(:"tags/show")
end

# edit
get '/tags/:id/edit' do
  @tag = Tag.find(params['id'].to_i)
  erb( :"tags/edit" )
end

#new
get '/tags/new' do
  erb ( :"tags/new" )
end

# create
post "/tags" do
  @tag = Tag.new(params)
  @tag.save()
  erb(:"tags/new")
end

# update
post "/tags/id" do
  @tag = Tag.new(params)
  @tag.update()
  redirect to("/tags")
end

# delete
post '/tags/:id/delete' do
  @tag = Tag.find(params[:id].to_i)
  @tag.delete()
  redirect to ("/tags")
