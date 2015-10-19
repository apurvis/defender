class WitnessesController < PeopleCasesController
  def index
    @class_name = 'Witness'
    @people = Witness.all.map { |w| w.person }
  end
end
