class BikeEventsController < ApplicationController
  respond_to :json, :html
  before_action :authorize_user, only: [:new, :create, :edit, :update, :delete]

  def index
    @bike_event ||= BikeEvent.new 
    respond_with BikeEvent.all
  end

  def new
    @bike_event = BikeEvent.new 
  end

  def create
    @bike_event = current_user.bike_events.new(bike_event_params)
    if @bike_event.save
      render partial: 'show', locals: { bike_event: @bike_event }, layout: false
    else
      render partial: 'form', status: 422, layout: false
    end
  end

  def edit
  end

  def destroy
    bike_event = BikeEvent.find(params[:id])
    bike_event.delete 
    # respond_with bike_event
    # need to add a failure
    # ajax call to destroy means no need to redirect
  end

  private
  def bike_event_params
    params.require(:bike_event).permit(:event_kind, :occurred_at, :details,
                                        :user_id, :latitude, :longitude )
  end


end
