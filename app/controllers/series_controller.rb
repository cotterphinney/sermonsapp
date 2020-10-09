class SeriesController < ApplicationController
  def index
    @series = Series.all
  end

  def show
    @series = Series.find(params[:id])
    @sermons = @series.sermons
  end

  def new
    @series = Series.new
  end

  def edit
    @series = Series.find(params[:id])
  end

  def create
    @series = Series.new(series_params)

    if @series.save
      redirect_to @series
    else
      render 'new'
    end
  end

  def update
    @series = Series.find(params[:id])

    if @series.update(series_params)
      redirect_to @series
    else
      render 'edit'
    end
  end

  def destroy
    @series = Series.find(params[:id])
    @series.destroy

    redirect_to series_index_path
  end

  private
  def series_params
    params.require(:series).permit(:title, :image)
  end
end
