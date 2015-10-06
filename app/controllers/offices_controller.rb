class OfficesController < ApplicationController
  def index
    @offices = Office.all
  end

  def show
    @office = Office.where(id: params[:id]).first
  end

  def edit
    @office = Office.where(id: params[:id]).first
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)

    if @office.save
      redirect_to offices_path
    else
      render 'new'
    end
  end

  def update
    @office = Office.where(id: params[:id]).first

    if @office.update(office_params)
      redirect_to offices_path
    else
      render 'edit'
    end
  end

  def destroy
    @office = Office.where(id: params[:id]).first

    if @office.cases.size > 0
      redirect_to offices_path, alert: "Cannot delete office #{@office.name} which still has #{@office.cases.size} associated cases."
    else
      @office.destroy
      redirect_to offices_path, notice: "Office #{@office.name} deleted."
    end
  end

  private

  def office_params
    params.require(:office).permit(:name)
  end
end
