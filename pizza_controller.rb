require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order.rb')

# read all orders
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# new order
get '/pizza_orders/new' do
  erb(:new)
end

# show order
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# create order
post'/pizza_orders'do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end


# edit existing orders
get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

#update the order
post '/pizza_orders/:id' do # update
  PizzaOrder.new( params ).update
  redirect to '/pizza_orders'
end

#delete the order
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  erb(:delete)
  # redirect to('/pizza_orders')
end
