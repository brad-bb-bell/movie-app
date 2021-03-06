class ActorsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  def index
    actor = Actor.all
    render json: actor.as_json
  end

  def show
    actor_id = params[:id]
    actor = Actor.find_by(id: actor_id)
    render json: actor.as_json,
  end

  def create
    actor = Actor.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      known_for: params["known_for"],
      movie_id: params["movie_id"],
      gender: params["gender"],
      age: params["age"],
    )
    if actor.save
      render json: actor.as_json
    else
      render json: { errors: actor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    actor_id = params[:id]
    actor = Actor.find_by(id: actor_id)
    actor.first_name = params["first_name"] || actor.first_name
    actor.last_name = params["last_name"] || actor.last_name
    actor.known_for = params["known_for"] || actor.known_for
    actor.movie_id = params["movie_id"] || actor.movie_id
    actor.gender = params["gender"] || actor.gender
    actor.age = params["age"] || actor.age
    if actor.save
      render json: actor.as_json
    else
      render json: { errors: actor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    actor_id = params[:id]
    actor = Actor.find_by(id: actor_id)
    actor.destroy
    render json: { message: "Actor deleted." }
  end
end
