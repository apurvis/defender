class JudgesController < PeopleController
  def index
    @class_name = 'Judge'
    @people = Judge.all
  end

  def new
    @person = Judge.new
  end
end
