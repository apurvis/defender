class PeopleController < ApplicationController
  before_action :authenticate_user!

  def index
    @class_name = 'Person'
    @people = Person.all
  end

  def show
    @person = Person.where(id: params['id']).first
  end

  def edit
    @person = Person.where(id: params['id']).first
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end

  def update
    @person = Person.where(id: params['id']).first

    if @person.update(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    person = Person.where(id: params[:id]).first
    person_name = person.name
    if person.cases.size > 0
      redirect_to people_path, alert: "Cannot delete person #{person.name} who still has cases in the system."
    else
      person.destroy
      redirect_to people_path, notice: "Person #{person_name} deleted."
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :immigration_status, :type)
  end
end
