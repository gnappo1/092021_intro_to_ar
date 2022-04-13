class SessionsController < ApplicationController

  # POST: /sessions
  post "/login" do
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id #save user id into server memory
      # binding.pry
      halt 200, {user: user, message: "User successfully logged in!"}.to_json
    else
      halt 404, {error: "Invalid Credentials!"}.to_json
    end
  end

  delete "/logout" do
    session.delete("user_id")
    {message: "User successfully logged out!"}.to_json
  end
end
