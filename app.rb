require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:database.sqlite3'

require './models'

# the root route displays all of the posts
# their is a typo on line 4 of index.erb  
get '/' do
  @posts = Post.all
  erb :index
end
# this maps the / url to the template index.html (or index.erb) which is found in the "views/posts/" directory


get '/create' do
  @post = Post.new
  erb :create
end
get '/posts' do
  # @posts = Post.find(1)
    @posts = Post.new(params[:user])
  erb :posts
end

post '/posts' do
  @post = Post.new(title: params[:title], body: params[:body])
  if @post.save
    redirect '/'
  else
    erb :create
  end
end
