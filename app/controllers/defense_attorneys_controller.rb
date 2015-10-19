class DefenseAttorneysController < PeopleCasesController
  def index
    @class_name = 'DefenseAttorney'
    @people = DefenseAttorney.all.map { |w| w.person }
  end
end
