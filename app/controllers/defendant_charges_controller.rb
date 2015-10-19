class DefendantChargesController < ApplicationController
  def new
    @defendant = Defendant.find_by_id(params[:defendant_id])
    @defendant_charge = DefendantCharge.new
    @charges = Charge.all
  end

  def create
    @defendant_charge = DefendantCharge.new(defendant_charge_params)

    unless @defendant_charge.save
      flash.alert = 'Failed to link to case'
    end

    redirect_to @defendant_charge.defendant.case
  end

  def edit
    @defendant_charge = DefendantCharge.where(id: params['id']).first
  end

  def update
    @defendant_charge = DefendantCharge.where(id: params['id']).first

    if @defendant_charge.update(defendant_charge_params)
      redirect_to @defendant_charge.case
    else
      render 'edit'
    end
  end

  def destroy
    defendant_charge = DefendantCharge.where(id: params['id']).first
    @case = defendant_charge.case
    notice = "Removed #{defendant_charge.charge.name} from #{defendant_charge.case.formatted_name}"
    defendant_charge.destroy
    flash.notice = notice
    redirect_to @case
  end

  private

  def defendant_charge_params
    params.require(:defendant_charge).permit(:defendant_id, :charge_id, :comment)
  end
end
