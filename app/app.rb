
require 'sinatra'
require 'sinatra/reloader'
require 'mysql2'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection('development')

class User < ActiveRecord::Base
end

get '/' do
  @title = "login_page"
  erb :login_page
end

post '/home' do
  @title = "home"
  # @user_name = [:user_name]
  erb :home
end

post '/login_failure' do
  @title =  "login_failure"
  erb :login_failure
end

post '/create_account' do
  @title = "create_account"
  erb :create_account
end
