require 'bundler'
Bundler.require

require 'rack'
require 'sinatra/reloader'
require 'rack-flash'

set :bind, '0.0.0.0'
# set :environment, :production


# connectionのところのdevelopmentはシンボルで
ActiveRecord::Base.configurations=YAML.load_file('db/database.yml')
ActiveRecord::Base.establish_connection(:development)

class Line

  class User < ActiveRecord::Base

    has_many :Comments

    #　passwordをハッシュ化→bcrypt　gemを読み込む
    has_secure_password
    # これはDB上でnot nullにしているのでいらないかも
    validates :name, :password, :email, presence: true
    validates :password, :email, length: { minimum: 6 }
  end


  class Comment < ActiveRecord::Base
    #usersとリレーション
     belongs_to :user
  end

  #セッション
  enable :sessions
  # Flashが使用可
  use Rack::Flash

  before do
    set_login_user
    set_to_user
  end

  helpers Sinatra::ContentFor
  helpers do

    def login?
      session[:user_id].present?
    end

    def set_login_user
      @login_user = User.find_by(id: session[:user_id]) if login?
    end

    def exist?
       params[:id].present?
    end

    def set_to_user
      @to_user_id = Comment.find_by(to_user: params[:id]) if exist?
    end

  # エスケープ処理
    include Rack::Utils
    alias_method :h, :escape_html
  end

  #-----------------------------------------------------------------

  get '/' do
     @title ='index_page'
     erb :index_page
  end


  get '/login' do
    @title = "login_page"
    erb :login_page
  end

  post '/login' do

    user = User.find_by(name: params[:name])
    #userの名前とパスワードの一致させる
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインに成功しました。"
      redirect "/home"
    else
      flash[:notice] = "ログインしてください"
      erb :login_page
    end
  end

  get '/home' do
    @users = User.order("id")

    erb :home
  end

  get '/my_page' do

  end


  get '/talk/:id/:name' do
    @to_user_id = params[:id]
    @to_user = params[:name]
    @comments = Comment.where(user_id: session[:user_id], to_user: @to_user_id).all
    # @comments = Comment.find_by(user_id: session[:id], to_user: params[:id])

    erb :talk
  end

  post '/new' do
    if params[:body].present?
       @comments = Comment.create( user_id: session[:user_id], body: params[:body], to_user: params[:id])
       redirect back
    end
  end

  post '/login_failure' do
    @title = "login_failure"
     "ログインに失敗しました"
    redirect '/login'
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
      u.save
    end

    # userが有効で保存されているなら
    if user.valid? && user.save
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect '/home'
    else
      redirect back
    end

  end

  get '/logout' do
    session.clear
  end

# HelloWorldApp.run! if app_file == $0
  

end








