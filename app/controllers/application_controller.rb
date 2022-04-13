require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    # set :views, 'app/views'
    set :default_content_type, :json
    set :session_secret, ENV["SESSION_SECRET"]
  end

  error ActiveRecord::RecordNotFound do
    # 'Sorry there was a nasty error - ' + env['sinatra.error'].message
    {errors: "Record not found with id #{params['id']}"}.to_json
  end
  
  get "/me" do
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    if @current_user 
      halt 200, {user: @current_user}.to_json
    else 
      halt 404, {error: "No one is logged in!"}.to_json
    end
  end

  private

  def shared_helper_method
    puts "I am visible in every controller!"
  end

  # error do
  #   'Sorry there was a nasty error - ' + env['sinatra.error'].message
  # end

end
