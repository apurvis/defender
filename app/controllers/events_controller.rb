class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.where(id: params[:id]).first
  end

  def edit
    @event = Event.where(id: params[:id]).first
    @case = @event.case
  end

  def new
    @case = Case.where(id: params[:case_id]).first
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    @event = Event.where(id: params['id']).first

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    event = Event.where(id: params[:id]).first
    if event.people.size > 0
      redirect_to events_path, alert: "Cannot delete event #{event.id} which still has associated people."
    else
      event.destroy
      redirect_to events_path, notice: "Event #{event.id} deleted."
    end
  end

  private

  def event_params
    params.require(:event).permit(:type, :case_id, :happened_at, :comment, :hearing_type)
  end
end
