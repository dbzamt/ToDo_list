# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! :name => 'admin 1', :email => 'admin1@admin.com', :password => 'password', :password_confirmation => 'password',:admin => true
User.create! :name => 'admin 2', :email => 'admin2@admin.com', :password => 'password', :password_confirmation => 'password',:admin => true
User.create! :name => 'admin 3', :email => 'admin3@admin.com', :password => 'password', :password_confirmation => 'password',:admin => true
User.create! :name => 'Developer 1', :email => 'Developer1@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 2', :email => 'Developer2@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 3', :email => 'Developer3@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 4', :email => 'Developer4@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 5', :email => 'Developer5@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 6', :email => 'Developer6@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 7', :email => 'Developer7@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 8', :email => 'Developer8@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 9', :email => 'Developer9@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 10', :email => 'Developer10@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 11', :email => 'Developer11@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
User.create! :name => 'Developer 12', :email => 'Developer12@admin.com', :password => 'password', :password_confirmation => 'password',:admin => false
