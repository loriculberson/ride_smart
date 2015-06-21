class BikeEventsController < ApplicationController
  respond_to :json, :html
  before_action :authorize_user, only: [:new, :create, :edit, :update, :delete]

  def index
    @bike_event ||= BikeEvent.new 
    respond_with BikeEvent.all
  end

  def new
  end

  def create
    @bike_event = current_user.bike_events.new(bike_event_params)
    if @bike_event.save
      flash[:success] = "Thanks for keeping our roads safe."
      redirect_to bike_events_path
    else
      render :new
    end
  end

  def edit
  end

  private
  def bike_event_params
    params.require(:bike_event).permit(:event_kind, :occurred_at, :details,
                                        :user_id, :latitude, :longitude )
  end


end
