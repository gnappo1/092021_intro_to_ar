class PlantsController < ApplicationController

  # GET: /plants
  get "/plants" do #index
    Plant.all.to_json(include: [user: {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at])
  end

  # POST: /plants
  post "/plants" do #show
    @plant = Plant.create(params)
    if @plant.id
      halt 201, {plant: serialized_plant, message: "Plant successfully created!"}.to_json
    else
      halt 500, {message: @plant.errors.full_messages.to_sentence}.to_json
    end
  end

  # GET: /plants/5
  get "/plants/:id" do
    # begin 
    #   Plant.find(params["id"]).to_json(include: :plants)
    # rescue ActiveRecord::RecordNotFound => e
    #   {errors: e}.to_json
    # end
    find_plant
    if @plant
      serialized_plant
    else
      {message: "Record not found with id #{params['id']}"}.to_json
    end
  end

  # PATCH: /plants/5
  patch "/plants/:id" do
    find_plant
    if @plant && @plant.update(params)
      serialized_plant
    elsif !@plant
      {message: "Record not found with id #{params['id']}"}.to_json
    else
      {message: @plant.errors.full_messages.to_sentence}.to_json
    end
  end

  # DELETE: /plants/5/delete
  delete "/plants/:id" do
    find_plant
    if @plant&.destroy
      {messages: "Record successfully destroyed"}.to_json
    else
      {message: "Record not found with id #{params['id']}"}.to_json
    end
  end


  private

  def find_plant
    @plant = Plant.find_by_id(params["id"])
  end

  def serialized_plant
    @plant.to_json(include: :user)
  end
end
