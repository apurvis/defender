class ArrestsController < EventsController
  def index
    @events = Arrest.all
  end

  def new
    @event = Arrest.new
  end
end
