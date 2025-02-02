class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.joins(:movie).select("schedules.*,movies.name")
  end

  def new
    @schedule = Schedule.new
    @movie = Movie.find_by(params[:movie_id_param])
  end

  def show
    @schedules = Schedule.find(params[:id])
    @movie = Movie.find(params[:id])
  end

  def create
    @schedules = Schedule.new(schedule_params)
    if @schedules.save
      flash[:notice] = "登録が完了しました"
      redirect_to admin_movies_path
    else
      flash.now[:alert] = "入力に誤りがあります"
      render status:302, action: :new
    end
  end

  def edit
    @schedules = Schedule.find(params[:id])
    @movies = Movie.where(id: @schedules.movie_id)
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:notice] = "更新が完了しました!"
      redirect_to admin_schedules_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render status:302, action: :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      flash[:notice] = "削除完了"
      redirect_to admin_schedules_path
    else
      flash.now[:alert] = "削除に失敗しました"
      render status:302, action: :edit
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:movie_id, :start_time, :end_time)
  end

end
