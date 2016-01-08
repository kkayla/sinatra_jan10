require 'sinatra'
require 'sinatra/activerecord'

 set :database, 'sqlite3:database.sqlite3'
# class Post  < ActiveRecord::Base
# end
#
# get '/' do
#   @posts = Post.all
# erb :index
# end
#
# get '/user'
# @user = current_user
# erb :welcome
# do
# end
#make a form on the welcome.erb view so the user can make a new post on their welcome page
