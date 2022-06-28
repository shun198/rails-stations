class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true)
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules.where(movie_id: @movie.id)
    @schedule_array = Schedule.select(:id).where(movie_id: @movie.id)
    #binding.pry
  end
end
