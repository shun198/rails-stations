class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @count = Sheet.count
    if params[:date] == ""
      @date = nil
    else
      @date = params[:date]
    end
    @movie_id = params[:movie_id]
    @schedule_id = params[:schedule_id]
    if @date == nil?
      render status: 400
    elsif @date == "" 
      render status: 200
    end
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
    if params[:movie][:date] == ""
      @date == nil
    else
      @date = params[:movie][:date]
    end
    if @date == nil?
      render status: 400
    elsif @date == "" 
      render status: 200
    end
  end

  def reservation_params
    params.require(:sheet).permit(:movie_id, :schedule_id, :sheet_id)
  end
end
