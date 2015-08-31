class WitnessesController < PeopleController
  def index
    @class_name = 'Witness'
    @people = Witness.all
  end
end
