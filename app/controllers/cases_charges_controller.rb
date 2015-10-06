class CasesChargesController < ApplicationController
  def new
    @case = Case.find_by_id(params[:case_id])
    @charges = Charge.all
    @case_charge = CasesCharge.new
  end

  def create
    @case = Case.find_by_id(params[:cases_charge][:case_id])
    @case_charge = CasesCharge.new(cases_charge_params)

    unless @case_charge.save
      flash.alert = 'Failed to link to case'
    end

    redirect_to @case
  end

  def edit
    @case_charge = CasesCharge.where(id: params['id']).first
  end

  def update
    @case_charge = CasesCharge.where(id: params['id']).first

    if @case_charge.update(cases_charge_params)
      redirect_to @case_charge.case
    else
      render 'edit'
    end
  end

  def destroy
    case_charge = CasesCharge.where(id: params['id']).first
    @case = case_charge.case
    notice = "Removed #{case_charge.charge.name} from #{case_charge.case.formatted_name}"
    case_charge.destroy
    flash.notice = notice
    redirect_to @case
  end

  private

  def cases_charge_params
    params.require(:cases_charge).permit(:case_id, :charge_id, :comment)
  end
end
