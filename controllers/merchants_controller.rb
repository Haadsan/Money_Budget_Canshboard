require("sinatra")
require("sinatra/contrib/all" ) if development?

require_relative("../models/transaction")
require_relative("../models/tag")
require_relative('../models/merchant.rb')

also_reload( '../models/*' )
require("pry-byebug")



get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

# get '/merchants/:id' do
#   @merchant = Merchant.find(params['id'].to_i)
#   erb( :"merchants/show" )
# end
#
# get '/merchants/new' do
#   erb(:"merchants/new")
# end
#
# get "/merchants/:id/edit" do
#   @merchant = Merchant.find(params[:id])
#   erb(:"merchants/edit")
# end

# post "/merchants" do
#   @merchant = Merchant.new(params)
#   @merchant.save()
#   erb(:"merchants/create")
# end
#
# post "/merchants/edit/:tag_id" do
#   @merchant = Merchant.new(params)
#   @merchant.update()
#   redirect to("/merchants")
# end
#
# post '/merchants/:id/delete' do
#   @merchant = Merchant.find(params[:id])
#   @merchant.delete()
#   redirect '/merchants'
# end
