class InvestigationsController < EventsController
  def index
    @events = Investigation.all
  end

  def new
    @event = Investigation.new
  end
end
