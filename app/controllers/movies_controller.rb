class MoviesController < ApplicationController
  
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    
  end

  def new
    @movie = Movie.new
  end

  def edit
    
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to @movie
  end

  def update
    
    @movie.update(movie_params)
    redirect_to @movie
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
    def movie_params
      params.require(:movie).
        permit(:title, :rating, :total_gross, :description, :released_on)
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end

end
