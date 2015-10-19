class JudgesController < PeopleCasesController
  def index
    @class_name = 'Judge'
    @people = Judge.all.map { |j| j.person }
  end
end
