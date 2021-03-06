class MoviesController < ApplicationController
  
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.released
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
    if @movie.save
      redirect_to @movie, notice: "#{@movie.title} created successfully!"
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "#{@movie.title} updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, alert: "#{@movie.title} deleted successfully!"
  end

  private
    def movie_params
      params.require(:movie).
        permit(:title, :rating, :total_gross,
               :description, :released_on, :cast,
               :director, :duration, :image_file_name)
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end

end
