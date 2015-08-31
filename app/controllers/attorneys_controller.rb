class AttorneysController < ApplicationController
  before_action :authenticate_user!

  def index
    @attorneys = Attorney.all
  end

  def show
    @attorney = Attorney.where(id: params['id']).first
  end

  def edit
    @attorney = Attorney.where(id: params['id']).first
  end

  def new
    @attorney = Attorney.new
  end

  def create
    @attorney = Attorney.new(attorney_params)

    if @attorney.save
      redirect_to @attorney
    else
      render 'new'
    end
  end

  def update
    @attorney = Attorney.where(id: params['id']).first

    if @attorney.update(attorney_params)
      redirect_to @attorney
    else
      render 'edit'
    end
  end

  def destroy
    attorney = Attorney.where(id: params[:id]).first
    attorney_name = attorney.name
    if attorney.cases.size > 0
      flash.alert = "Cannot delete attorney #{attorney.name} who still has cases in the system."
      redirect_to attorneys_path
    else
      attorney.destroy
      redirect_to attorneys_path, notice: "Attorney #{attorney.name} deleted."
    end
  end

  private

  def attorney_params
    params.require(:attorney).permit(:name, :state, :start_date, :blue_book_code, :expiration_date)
  end
end
