class PhoneNumbersController < ApplicationController
  def index
    @phone_numbers = PhoneNumber.all
  end

  def edit
    @defendant = Defendant.where(id: params['id']).first
  end

  def new
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number = Attorney.new(phone_number_params)

    if @phone_number.save
      redirect_to @phone_number
    else
      render 'new'
    end
  end

  def phone_number_params
    params.require(:phone_number).permit(:phoneable_type, :phoneable_id, :description, :number)
  end
end
