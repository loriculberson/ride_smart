class BikeEventsController < ApplicationController
  respond_to :json, :html

  def index
    @bike_event ||= BikeEvent.new 
    respond_with BikeEvent.all
  end

  def new
  end

  def create
    @bike_event = BikeEvent.new(bike_event_params)
    if @bike_event.save
      flash[:success] = "Thanks for keeping our roads safe."
      redirect_to bike_events_path
    else
      render :new
    end
  end

  def edit
    @bike_event = BikeEvent.find(5)
  end

  private
  def bike_event_params
    params.require(:bike_event).permit(:event_kind, :occurred_at, :details,
                                        :user_id, :latitude, :longitude )
  end
end
