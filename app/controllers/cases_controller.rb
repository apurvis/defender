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
    @case = Case.new(statute_params)

    if @case.save
      redirect_to @case
    else
      render 'new'
    end
  end

  def update
    @case = Case.where(id: params['id']).first

    if @case.update(statute_params)
      redirect_to @case
    else
      render 'edit'
    end
  end

  private

  def statute_params
    params.require(:case).permit(:name, :state, :start_date, :blue_book_code, :expiration_date)
  end
end
