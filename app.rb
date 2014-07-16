require "sinatra"
require "active_record"
require "gschool_database_connection"
require_relative "models/app_model"
require "rack-flash"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])
  end

  get "/" do
    erb :home
  end

  post "/" do
    email = params[:email]
    password = params[:password]

    add_user(email, password)
    flash[:notice] = "Thanks for signing up!"

    redirect "/"
  end

  get "/emails" do
    emails = get_emails
    erb :emails, locals: {:emails => emails}
  end
end
