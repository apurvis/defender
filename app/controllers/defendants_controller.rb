class DefendantsController < PeopleCasesController
  def index
    @class_name = 'Defendant'
    @people = Defendant.all.map { |d| d.person }
  end
end
