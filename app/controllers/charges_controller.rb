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
  end

  def edit
    @charge = Charge.find(params[:id])
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

  def update
    @charge = Charge.find(params[:id])

    respond_to do |format|
      if @charge.update_attributes(params[:charge])
        format.html  { redirect_to(@charge, :notice => "Charge #{@charge.id} was successfully updated.") }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @charge.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy

    respond_to do |format|
      format.html { redirect_to charges_url }
      format.json { head :no_content }
    end
  end
end
