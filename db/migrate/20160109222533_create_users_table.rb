class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |users|
      users.string :username
      users.string :email
      users.string :password
  end
end
