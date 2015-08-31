class WitnessesController < PeopleController
  def index
    @class_name = 'Witness'
    @people = Witness.all
  end

  def new
    @person = Witness.new
  end
end
