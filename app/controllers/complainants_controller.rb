class ComplainantsController < PeopleCasesController
  def index
    @class_name = 'Complainant'
    @people = Complainant.all.map { |w| w.person }
  end
end
