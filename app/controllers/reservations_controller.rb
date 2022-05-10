class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservations = Reservation.new(reservation_params)
    binding.pry
    if @reservations.save
      flash[:notice] = "登録が完了しました"
      redirect_to "/movies/:id"
    else
      flash.now[:alert] = "入力に誤りがあります"
      render status:302, action: :new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email,:name)
  end

end
