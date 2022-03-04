class PlantsController < ApplicationController

  # GET: /plants
  get "/plants" do
    Plant.all.to_json(include: [user: {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at])
  end

  # POST: /plants
  post "/plants" do
    @plant = Plant.create(params)
    binding.pry
    if @plant.id
      serialized_plant
    else
      @plant.errors.full_messages.to_sentence
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
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end

  # PATCH: /plants/5
  patch "/plants/:id" do
    find_plant
    if @plant && @plant.update(params)
      serialized_plant
    elsif !@plant
      {errors: "Record not found with id #{params['id']}"}.to_json
    else
      {errors: @plant.errors.full_messages.to_sentence}.to_json
    end
  end

  # DELETE: /plants/5/delete
  delete "/plants/:id" do
    find_plant
    if @plant&.destroy
      {messages: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
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
