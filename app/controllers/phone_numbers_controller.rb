class PhoneNumbersController < ApplicationController
  def index
    @phone_numbers = PhoneNumber.all
  end

  def edit
    @phone_number = PhoneNumber.where(id: params['id']).first
  end

  def new
    @phone_number = PhoneNumber.new
    @person = Person.find_by_id(params[:person_id])
  end

  def create
    @phone_number = PhoneNumber.new(phone_number_params)
    @person = Person.find_by_id(phone_number_params[:phoneable_id])

    if @phone_number.save
      redirect_to @person
    else
      render 'new'
    end
  end

  def destroy
    @phone_number = PhoneNumber.where(id: params['id']).first
    person = @phone_number.phoneable
    flash.notice = "Deleting phone number #{@phone_number.number}"
    @phone_number.destroy

    redirect_to person
  end

  def phone_number_params
    params.require(:phone_number).permit(:phoneable_type, :phoneable_id, :description, :number)
  end
end
