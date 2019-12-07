require './config/environment'
#The ( :: ) symbol below is a unary operator that allows: constants, instance methods and class methods defined within a class or module, to be accessed from anywhere outside the class or module.
# Base class inside the ActiveRecord.Module
class ApplicationController < Sinatra::Base
  enable :sessions

  configure do
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

get '/' do
   erb :index
 end


 helpers do

   def logged_in?
     !!current_user
   end

 def current_user
   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
   end
 end



end
