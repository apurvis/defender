class ChargesController < ApplicationController
  before_action :authenticate_user!

  def index
    @charges = Charge.all
  end

  def show
    @charge = Charge.where(id: params['id']).first
  end

  def edit
    @charge = Charge.where(id: params['id']).first
  end

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(charge_params)

    if @charge.save
      redirect_to @charge
    else
      render 'new'
    end
  end

  def update
    @charge = Charge.where(id: params['id']).first

    if @charge.update(charge_params)
      redirect_to @charge
    else
      render 'edit'
    end
  end

  def destroy
    @charge = Charge.where(id: params['id']).first
    if @charge.cases.size > 0
      redirect_to charges_path, alert: "Cannot delete #{@charge.name} - still has #{@charge.cases.size} linked cases"
    else
      @charge.destroy
      redirect_to charges_path, :notice => "Charge Deleted."
    end
  end

  private

  def charge_params
    params.require(:charge).permit(:name, :offense_type)
  end
end
