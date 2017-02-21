require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')


# INDEX - READ for ALL
get '/pizzas' do
 @pizzas = Pizza.all()
  erb (:index)
end

# NEW -  CREATE - get form
get '/pizzas/new' do
  erb(:new)
end


# SHOW - READ for ID
  get '/pizzas/:id' do #:id is a string for  params[:id]
  @pizza = Pizza.find( params[:id] )
  erb (:show)
 end 



# CREATE - CREATE - submit form
 post '/pizzas' do
    @pizza = Pizza.new(params)
    @pizza.save()
    erb(:create)

 # no confirm
 # post '/pizzas' do
 # @pizza = Pizza.new(params)
 # @pizza.save
 # redirect to '/pizzas/' +pizza.id.to_s
end

# EDIT- UPDATE - Create form
get '/pizzas/:id/edit' do
 @pizza = Pizza.find( params[:id] )
 erb(:update)
end

# UPDATE - UPDATE - submit form
post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb(:update)
  redirect to "/pizzas/#{@pizza.id}"
end

# DESTROY - DELETE
post '/pizzas/:id/delete' do
 @pizza = Pizza.find(params[:id]) 
 @pizza.delete
erb(:delete)
end



