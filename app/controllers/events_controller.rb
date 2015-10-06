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
    @case = Case.where(id: event_params[:case_id]).first

    if @event.save
      redirect_to @event.case
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
      redirect_to event.case, alert: "Cannot delete event #{event.id} which still has associated people."
    else
      event.destroy
      redirect_to event.case, notice: "#{event.type} (#{event.hearing_type || event.title} on #{event.happened_at}) id #{event.id} deleted."
    end
  end

  private

  def event_params
    common_params = [:type, :case_id, :happened_at, :comment, :title]
    hearing_params = common_params + [:hearing_type]
    local_event_params = params.require(:event).permit(*hearing_params)

    [:investigation, :court_appearance, :arrest].each do |subclass|
      if params[subclass]
        local_event_params.merge!(params.require(subclass).permit(*hearing_params))
      end
    end

    local_event_params
  end
end
