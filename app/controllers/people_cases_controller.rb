class PeopleCasesController < ApplicationController
  def new
    @case = Case.find_by_id(params[:case_id])
    @person_case = params[:person_class].safe_constantize.new
    @people = Person.all
  end

  def create
    @case = Case.find_by_id(people_case_params[:case_id])
    PeopleCase.subclasses.map { |c| c.to_s.underscore }.each do |subclass|
      if params[subclass]
        @person_case = subclass.to_s.camelcase.safe_constantize.new(people_case_params)
        break
      end
    end

    unless @person_case.save
      flash.alert = 'Failed to link to case'
    end

    redirect_to @case
  end

  def edit
    @person_case = PeopleCase.where(id: params['id']).first
  end

  def update
    @person_case = PeopleCase.where(id: params['id']).first

    if @person_case.update(people_case_params)
      redirect_to @person_case.case
    else
      render 'edit'
    end
  end

  def destroy
    person_case = PeopleCase.where(id: params[:id]).first
    @case = person_case.case

    if person_case.is_a?(Defendant) && person_case.defendant_charges.size > 0
      flash.alert = "Cannot delete Defendant who still has charges! (Remove all charges first)."
    else
      notice = "Removed #{person_case.class} #{person_case.person.name} from Docket Number #{person_case.case.docket_number}"
      person_case.destroy
      flash.notice = notice
    end

    redirect_to @case
  end

  private

  def people_case_params
    local_params = params.require(:people_case).permit(:person_id, :case_id, :comment)

    PeopleCase.subclasses.map { |c| c.to_s.underscore }.each do |subclass|
      if params[subclass]
        local_params.merge!(params.require(subclass).permit(:person_id, :case_id, :comment))
      end
    end

    local_params
  end
end
