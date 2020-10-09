class SermonsController < ApplicationController
  def index
    @sermons = Sermon.includes(:series).paginate(page: params[:page], per_page: 10)
  end

  def show
    @sermon = Sermon.find(params[:id])
  end

  def new
    @sermon = Sermon.new
  end

  def edit
    @sermon = Sermon.find(params[:id])
  end

  def create
    @sermon = Sermon.new(sermon_params)

    if @sermon.save
      redirect_to @sermon
    else
      render 'new'
    end
  end

  def update
    @sermon = Sermon.find(params[:id])

    if @sermon.update(sermon_params)
      redirect_to @sermon
    else
      render 'edit'
    end
  end

  def destroy
    @sermon = Sermon.find(params[:id])
    @sermon.destroy

    redirect_to sermons_path
  end

  private
  def sermon_params
    params.require(:sermon).permit(:title, :description, :date, :image, :series_id)
  end
end
