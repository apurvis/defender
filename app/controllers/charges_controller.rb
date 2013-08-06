class ChargesController < ApplicationController
  def new
  end

  def create
    @charge = Charge.new(params[:charge])

    respond_to do |format|
      if @charge.save
        format.html { redirect_to(@charge, :notice => "Charge #{@charge.id} was successfully created.")}
        format.json { render :json => @charge, :status => :created, :location => @charge }
      else
        format.html { render :action => "new" }
        format.json { render :json => @charge.errors, :status => :unprocessable_entity }
      end
    end

    redirect_to @charge
  end


  def show
    @charge = Charge.find(params[:id])
  end

  def index
    @charges = Charge.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @charges }
    end
  end

  private

  def charge_params
    params.require(:charge).permit(:name, :offense_type)
  end
end
