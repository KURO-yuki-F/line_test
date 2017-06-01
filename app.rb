
require 'bundler'
Bundler.require

require 'rack-flash'

ActiveRecord::Base.configurations = YAML.load_file("config/database.yml")
ActiveRecord::Base.establish_connection("development")



# class Line < ActiveRecord::Base

# before

# end
#
# end


  helpers do

    def login?
      !session[:password].nil?
    end

    def username

     if  login?
      User.find_by(session[:password]).name :''
     end

    end


     include Rack::Utils
     alias_method :h, :escape_html
    end
    #
    #   #セッション
     enable :sessions
     #Flashが使用可
     use Rack::Flash
    #
    #

    # get '/' do
    #   @title ='index_page'
    #   erb :index_page
    # end

    get '/login' do
      erb :login_page
    end

    post '/login' do

      @title = "login_page"
      user = User.find_by(name: params[:name])
      #userの名前とパスワードの一致
      if user && user.authenticate(params[:password])
        session[:user_name] = user.name
        flash[:notice] = "ログインに成功しました。"
        redirect "/home"
      else
        flash[:notice] = "ログインしてください。"
        erb :login_page
      end
    end

    get '/home' do
      erb :home
    end

    post '/home' do
      if login?
        @title = "home"
        @users = User.all
        @user_name = [:user_name]
        erb :home
      else
        redirect '/login'
      end

    end


    post '/login_failure' do
      @title =  "login_failure"
      erb :login_failure
    end

    get '/create_account' do
      erb :create_account
    end

    post '/create_account' do
      @title = "create_account"

      user = User.new do |u|
        u.name = params[:name]
        u.password = params[:password]
        u.email = params[:email]
      end

      if user.valid? && user.save
        session[:uid] = user.id
        redirect '/'
      else
        redirect back
      end

    end

    get '/logout' do
       'ログアウトしました。'
    end

# end
class User < ActiveRecord::Base

end

class Comment < ActiveRecord::Base
end
