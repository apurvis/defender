class PeopleCasesController < ApplicationController
  def new
    @case = Case.find_by_id(params[:case_id])
    @person_case = PeopleCase.new

    if params[:person_class]
      @person_class = params[:person_class]
      @people = params[:person_class].safe_constantize.all
    else
      flash.alert = "No person class provided"
      redirect_to cases_path
    end
  end

  def create
    @case = Case.find_by_id(people_case_params[:case_id])
    @person_case = PeopleCase.new(people_case_params)

    unless @person_case.save
      flash.alert = "Failed to link to case"
    end

    redirect_to @case
  end

  def people_case_params
    params.require(:people_case).permit(:person_id, :case_id)
  end
end
