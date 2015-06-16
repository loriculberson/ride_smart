class BikeEventsController < ApplicationController

  def index
  end

  def new
    @bike_event = BikeEvent.new
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


  private
  def bike_event_params
    params.require(:bike_event).permit(:event_kind, :occurred_at, :details,
                                        :user_id, :latitude, :longitude )
  end


end
