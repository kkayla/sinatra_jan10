class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body
  validates_presence_of :title
end
#we created this after we migrated the Post table using rake db:migrate
#################NOW WE HAVE TO REQUIRE THIS FILE on the app.rb file
class User < ActiveRecord::Base
  has_many :posts
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password
end
