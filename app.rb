require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

set :database, 'sqlite3:database.sqlite3'

require './models'

get '/login' do
  erb :login
end

post '/login' do
 @user = User.find_by(:username => params[:username])
 if @user && @user.password == params[:password]
   session[:user_id] = @user.id
   #log their ass in
    flash[:notice] = "you sticked that landing on the login!"
    redirect '/'
 else
   redirect '/signup'
end
end
#
# post '/login' do
#   user = User.find_by(:username => params[:username])
#   if @user && @user.password == params[:password]
#     session[:user_id] = @user.id
#     #log their ass in
#      flash[:notice] = "you sticked that landing on the login!"
#      redirect '/'
#   else
#     redirect '/signup'
# end
# end

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
    redirect '/post/:user_id'
  else
    erb :create
  end
end

get '/post/:user_id' do
    @user = current_user
    if @user
        @posts = Post.where(user_id: @user.id)
        @totalposts = Post.where(user_id: @user.id).all
        # puts 'my params for the post are' + "#{@totalposts[0].user_id}"
        erb :post
    else
        redirect '/'
    end
    erb :post
end
