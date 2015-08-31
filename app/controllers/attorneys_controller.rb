class AttorneysController < PeopleController
  def index
    @people = Attorney.all
  end
end
