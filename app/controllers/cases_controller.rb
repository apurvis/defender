class CasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cases = Case.all
  end

  def show
    @case = Case.where(id: params['id']).first
  end

  def edit
    @case = Case.where(id: params['id']).first
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(case_params)
    if @case.save
      redirect_to @case
    else
      render 'new'
    end
  end

  def update
    @case = Case.where(id: params['id']).first

    if @case.update(case_params)
      redirect_to @case
    else
      render 'edit'
    end
  end

  def destroy
    @case = Case.find_by_id(params['id'])
    if @case.people.size > 0
      flash.alert = "Cannot delete docket number #{@case.docket_number} because it is still attached to people"
    else
      @case.destroy
    end

    redirect_to cases_path
  end

  private

  def case_params
    params.require(:case).permit(
      :docket_number,
      :indictment_number,
      :status,
      :stage,
      :next_court_date,
      :next_court_part,
      :release_status,
      :new_york_state_id,
      :arrest_number,
      :office_id,
      :opened_date,
      :closed_date,
      :disposition_date,
      :final_disposition,
      :city_disposition,
      :city_disposition_date,
      :initial_top_charge_id,
      :current_top_charge_id,
      :disposition_top_charge_id,
      :itype,
      :dtype,
      :status_flag,
      :county_id,
      :top_sentence,
      :pro_bono,
      :lm_number,
      :case_type,
      :docket_plus,
      :sentence,
      :cab_number,
      :law_firm_matter_number,
      :aid,
      :dsp,
      :mica,
      :k_calendar,
      :contested,
      :board_case,
      :school_related,
      :warrant_number,
      :court_index,
      :probation_issue,
      :probation_request,
      :ati,
      :evaluation,
      :conflict_check,
      :start_workflow,
      :court_forum,
      :practice_id,
      :case
    )
  end
end
