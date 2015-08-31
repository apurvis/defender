class DefendantsController < ApplicationController
  def index
    @defendants = Defendant.all
  end

  def show
    @defendant = Defendant.where(id: params['id']).first
  end

  def edit
    @defendant = Defendant.where(id: params['id']).first
  end

  def new
    @defendant = Defendant.new
  end

  def defendant_params
    params.require(:attorney).permit(:name)
  end
end
