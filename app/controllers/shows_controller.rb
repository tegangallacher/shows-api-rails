class ShowsController < ApplicationController

  def show_params
    return params.require(:show).permit([:name, :series, :description, :image, :programmeID])
  end

  def index
    shows = Show.all()
    render({json: shows})
  end

  def create
    show = Show.create(show_params())
    render({json: show})
  end


end