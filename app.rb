require "sinatra"
require "active_record"
require "./lib/database_connection"
require_relative "models/app_model"
require "rack-flash"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @database_connection = DatabaseConnection.establish(ENV["RACK_ENV"])
  end

  get "/" do
    if session[:user_id]
      erb :homepage
    else
      erb :homepage_logged_out
    end
  end

  get "/register" do
    erb :register
  end

  post "/register" do
    email = params[:email]
    password = params[:password]
    database_insert_user(email, password)
    redirect "/"
  end

  post "/signin" do
    email = params[:email]
    password = params[:password]
    check_signin_set_session(email, password)
    redirect "/"
  end
end
