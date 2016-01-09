require 'sinatra'
require 'sinatra/activerecord'

 set :database, 'sqlite3:database.sqlite3'

 require './models'

get '/' do
  @posts = Post.all
  erb :index
end

# this maps the / url to the template index.html (or index.erb) which is found in the "views/posts/" directory

get '/onepost' do
  @the_last_post = Post.last
  erb :onepost
end

# make a form on the welcome.erb view so the user can make a new post on their welcome page
