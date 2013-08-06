class AttorneysController < ApplicationController
  def new
  end

  def create
    @attorney = Attorney.new(params[:attorney])

    respond_to do |format|
      if @attorney.save
        format.html { redirect_to(@attorney, :notice => "Attorney #{@attorney.id} was successfully created.")}
        format.json { render :json => @attorney, :status => :created, :location => @attorney }
      else
        format.html { render :action => "new" }
        format.json { render :json => @attorney.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @attorney = Attorney.find(params[:id])
  end

  def show
    @attorney = Attorney.find(params[:id])
  end

  def index
    @attorneys = Attorney.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @attorneys }
    end
  end

  def update
    @attorney = Attorney.find(params[:id])

    respond_to do |format|
      if @attorney.update_attributes(params[:attorney])
        format.html  { redirect_to(@attorney, :notice => "Attorney #{@attorney.id} was successfully updated.") }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @attorney.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @attorney = Attorney.find(params[:id])
    @attorney.destroy

    respond_to do |format|
      format.html { redirect_to attorneys_url }
      format.json { head :no_content }
    end
  end
end
