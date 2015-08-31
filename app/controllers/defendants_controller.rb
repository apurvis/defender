class DefendantsController < PeopleController
  def index
    @class_name = 'Defendant'
    @people = Defendant.all
  end
end
