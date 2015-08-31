class DefendantsController < PeopleController
  def index
    @people = Defendant.all
  end
end
