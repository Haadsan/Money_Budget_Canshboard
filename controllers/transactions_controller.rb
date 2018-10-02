require("sinatra")
require("sinatra/contrib/all" ) if development?

require_relative("../models/transaction")
require_relative("../models/tag")
require_relative('../models/merchant.rb')

also_reload( '../models/*' )
require("pry-byebug")



get '/transactions' do
  @transactions = Transaction.all()
  @total = Transaction.total
  erb(:"transactions/index")
end

get '/transactions/new' do
  @tags = Tag.all
  @merchants = Merchant.all
  erb(:"transactions/new")
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb( :"transactions/show" )
end


get "/transactions/:id/edit" do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
end

post "/transactions" do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:"transactions/create")
end

post "/transactions/:id" do
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect to("/transactions")
end

post '/transactions/:id/delete' do
  @transaction = Transaction.find(params[:id])
  @transaction.delete()
  redirect '/transactions'
end
