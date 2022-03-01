require "pry"
class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    User.all.to_json(include: [plants: {only: [:name, :species]}], except: [:created_at, :updated_at])
  end

  # POST: /users
  post "/users" do
    new_user = User.create(params)
    if new_user.id
      new_user.to_json
    else
      { errors: author.errors.full_messages.to_sentence }.to_json
    end
  end

  # GET: /users/5
  get "/users/:id" do
    begin
      User.find(params[:id]).to_json
    rescue ActiveRecord::RecordNotFound => e
      { error: e }.to_json
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    begin
      user = User.find(params[:id])
      begin
        user.update!(params)
        "Profile successfully updated!"
      rescue ActiveRecord::RecordInvalid, ActiveRecord::UnknownAttributeError => e
        { error: e}.to_json
      end
    end
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    user = User.find_by_id(params[:id])
    if user&.destroy
      "Your profile has been destoryed permamnently"
    else
      { errors: user.errors.full_messages.to_sentence }.to_json
    end
  end
end
