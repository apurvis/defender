class AttorneysController < PeopleController
  def index
    @class_name = 'Attorney'
    @people = Attorney.all
  end
end
