class CreatePosts < ActiveRecord::Migration
  #migration files are used for setting up my batabase tables
  def self.up
    create_table :posts do |p|
      p.string :title
      p.text :body
      p.timestamps
  end
end

  def self.down
    drop_table :posts
  end
end
