class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end


end
