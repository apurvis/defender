class DefendantsController < PeopleController
  def index
    @class_name = 'Defendant'
    @people = Defendant.all
  end

  def new
    @person = Defendant.new
  end
end
