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
    @attorney = Attorney.new(statute_params)

    if @attorney.save
      redirect_to @attorney
    else
      render 'new'
    end
  end

  def update
    @attorney = Attorney.where(id: params['id']).first

    if @attorney.update(statute_params)
      redirect_to @attorney
    else
      render 'edit'
    end
  end

  private

  def statute_params
    params.require(:attorney).permit(:name, :state, :start_date, :blue_book_code, :expiration_date)
  end
end
