class CourtAppearancesController < EventsController
  def index
    @events = CourtAppearance.all
  end

  def new
    @event = CourtAppearance.new
  end
end
