class ShowsController < ApplicationController

  before_action :authenticate_user!

  def show_params
    return params.require(:show).permit([:name, :series, :description, :image, :programmeID])
  end

  def index
    shows = current_user.favourite_shows()
   render :json => shows.as_json({
    include: :show
    })
  end

  def create
    show = Show.create(show_params())
    render({json: show})
  end


end