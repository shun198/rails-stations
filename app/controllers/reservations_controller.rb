class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @movie_id = params[:movie_id]
    @date = params[:date]
    @sheet_id = params[:sheet_id]
    @schedule_id = params[:schedule_id]
    if (@date.nil?) || (@sheet_id.nil?)
      render status: 400
    elsif @date && @sheet_id
      render status: 200
    end
  end

  def create
    @movie_id = params[:reservation][:movie_id]
    @schedule_id = params[:reservation][:schedule_id]
    @date = params[:reservation][:date]
    @reservations = Reservation.new(reservation_params)
    if @reservations.save
      flash[:notice] = "予約が完了しました"
      redirect_to movie_path(@movie_id)
    else
      flash.now[:alert] = " すでに予約があります"
      redirect_to movie_schedule_sheets_path(@movie_id,@schedule_id,date:@date)
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date,:schedule_id,:sheet_id,:email,:name)
  end

end
