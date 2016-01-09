cd class CreatePosts < ActiveRecord::Migration
  #migration files are used for setting up my batabase tables
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.datetime :created_at
      t.timestamps null: false
  end
  add_index :posts, :url, unique: true
end
end
#now we have to rake db:migrate and make a models.rb folder.  Just because we migrated, it doesn't change the posts table in the database until we rake
