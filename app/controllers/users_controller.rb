require "pry"
class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    User.all.to_json(include: [plants: {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at])
  end

  # POST: /users
  post "/users" do
    user = User.create(params)
    if user.id
      user.to_json(include: :plants)
    else
      user.errors.full_messages.to_sentence
    end
  end

  # GET: /users/5
  get "/users/:id" do
    
  end

  # PATCH: /users/5
  patch "/users/:id" do
    
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    
  end
end
