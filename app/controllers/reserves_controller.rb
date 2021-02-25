class ReservesController < ApplicationController

  def index
    @reserves = Reserve.all
  end

  def new
    @reserve = Reserve.new
  end

  def create
    @reserve = Reserve.new(params_reserve)
    if @reserve.save
      redirect_to root_path
      flash[:notice] = "予約が完了しました"
    else
      render 'new'
    end
  end

  def show
    @reserve = Reserve.find_by(id: params[:id])
  end

  def destroy
    @reserve = Reserve.find_by(id: params[:id])
    if @reserve.destroy
      redirect_to root_path
      flash[:notice] = "削除が完了しました"
    else
      render reserf_path
    end
  end

  def look
    @params = params[:date]
    @reserves = Reserve.where('start_time LIKE ?', "#{params[:date]}%")
  end

  private

  def params_reserve
    params.require(:reserve).permit(:id, :name, :start_time)
  end

end
