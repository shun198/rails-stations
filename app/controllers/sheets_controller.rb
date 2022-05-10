class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @count = Sheet.count
    #@schedules = Schedule.all
    @movies = Movie.all
  end

  def show
    @id = params[:id]
    @movies = Movie.find_by(id: @id)
    @schedules = Schedule.where(movie_id: @id)
  end

  def new
    @sheets = Sheet.all
    @count = Sheet.count
    @movies = Movie.all
  end
end
