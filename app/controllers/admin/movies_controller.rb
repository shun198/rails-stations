class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = Schedule.where(movie_id: @movie.id)
    binding.pry
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "登録が完了しました"
      redirect_to admin_movies_path
    else
      flash.now[:alert] = "入力に誤りがあります"
      render status:302, action: :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @schedules = Schedule.where(movie_id: @movie.id)
  end

  def update
    @movie = Movie.find(params[:id])
    binding.pry
    if @movie.update(movie_params)
      flash[:notice] = "更新が完了しました!"
      redirect_to admin_movies_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render status:302, action: :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      flash[:notice] = "削除完了"
      redirect_to admin_movies_path
    else
      flash.now[:alert] = "削除に失敗しました"
      render status:302, action: :edit
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end

end
