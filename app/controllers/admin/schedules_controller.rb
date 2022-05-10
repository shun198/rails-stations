class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.joins(:movie).select("schedules.*,movies.name")
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedules = Schedule.find(params[:id])
    @movies = Movie.where(id: @schedules.movie_id)
    binding.pry
  end


  def create
    @schedules = Schedule.new(schedule_params)
    binding.pry
    if @schedules.save
      flash[:notice] = "登録が完了しました"
      redirect_to admin_movies_path
    else
      flash.now[:alert] = "入力に誤りがあります"
      render status:302, action: :new
    end
  end

  def edit
    binding.pry
    @schedules = Schedule.find(params[:id])
    @movies = Movie.where(id: @schedules.movie_id)
    binding.pry
  end

  def update
    binding.pry
    @schedule = Schedule.find(params[:id])
    binding.pry
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
    params.require(:schedule).permit(:start_time, :end_time, :created_at, :updated_at)
  end

end
