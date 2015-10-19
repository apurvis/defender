class ProsecutingAttorneysController < PeopleCasesController
  def index
    @class_name = 'ProsecutingAttorney'
    @people = ProsecutingAttorney.all.map { |w| w.person }
  end
end
