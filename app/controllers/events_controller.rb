class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(company_params)
    if @event.save
      flash[:notice] = "Your event was successfully created!"
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end


  def update
    @event = Event.find(params[:id])
      if @event.update(event_params)
        flash[:notice] = 'Event was successfully updated'
        redirect_to events_path
      else
        render :edit
      end
    end

    def destroy
      @event = Event.find(params[:id])
      if @event.destroy
        flash[:notice] = "Event was destroyed"
        redirect_to events_path
      end
    end

  private
  def event_params
    params.require(:event).permit(:name, :date, :company_id)
  end
end
