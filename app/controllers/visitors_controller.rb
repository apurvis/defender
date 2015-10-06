class VisitorsController < ApplicationController
  def index
    if current_user
      redirect_to cases_path
    end
  end
end
