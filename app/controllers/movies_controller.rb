class MoviesController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    movie = Movie.all
    render json: movie.as_json
  end

  def show
    movie = Movie.find_by(id: params[:id])
    render json: movie.as_json
  end

  def create
    movie = Movie.new(
      title: params["title"],
      year: params["year"],
      plot: params["plot"],
      director: params["director"],
    )
    if movie.save
      render json: movie.as_json
    else
      render json: { errors: movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    movie_id = params[:id]
    movie = Movie.find_by(id: movie_id)
    movie.title = params["title"] || movie.title
    movie.year = params["year"] || movie.year
    movie.plot = params["plot"] || movie.plot
    movie.director = params["director"] || movie.director
    if movie.save
      render json: movie.as_json
    else
      render json: { errors: movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    movie_id = params[:id]
    movie = Movie.find_by(id: movie_id)
    movie.destroy
    render json: { message: "Movie deleted." }
  end
end
