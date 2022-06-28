class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to admin_reservations_path
    else
      flash.now[:alert] = "入力に誤りがあります"
      render status:400, action: :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice] = "更新が完了しました!"
      redirect_to admin_reservations_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render status:400, action: :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      flash[:notice] = "削除完了"
      redirect_to admin_reservations_path
    else
      flash.now[:alert] = "削除に失敗しました"
      render status:400, action: :edit
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name)
  end
end