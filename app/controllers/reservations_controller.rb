class ReservationsController < ApplicationController
  def all
    @reservations = Reservation.all
  end

  def index
    @book = Book.find(params[:book_id])
    @book_reservations = @book.reservations(params[:book_id])
  end

  def show
    @book = Book.find(params[:book_id])
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @book = Book.find(params[:book_id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    if @reservation.save
      redirect_to book_reservation_url(@book.id, @reservation.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to book_reservations_url(@book.id)
  end

  def reservation_params
    params.require(:reservation).permit(:name, :due_date, :return_date, :book_id)
  end

  def new
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.build
  end

  def create
    @book = Book.find(params[:book_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to book_url(@book.id)
    else
      render :new
    end
  end

end
