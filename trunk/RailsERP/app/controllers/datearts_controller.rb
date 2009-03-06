class DateartsController < ApplicationController
  # GET /datearts
  # GET /datearts.xml
   before_filter :login_required
  def index
    @datearts = Dateart.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datearts }
    end
  end

  # GET /datearts/1
  # GET /datearts/1.xml
  def show
    @dateart = Dateart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dateart }
    end
  end

  # GET /datearts/new
  # GET /datearts/new.xml
  def new
    @dateart = Dateart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dateart }
    end
  end

  # GET /datearts/1/edit
  def edit
    @dateart = Dateart.find(params[:id])
  end

  # POST /datearts
  # POST /datearts.xml
  def create
    @dateart = Dateart.new(params[:dateart])

    respond_to do |format|
      if @dateart.save
        flash[:notice] = 'Dateart was successfully created.'
        format.html { redirect_to(@dateart) }
        format.xml  { render :xml => @dateart, :status => :created, :location => @dateart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dateart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datearts/1
  # PUT /datearts/1.xml
  def update
    @dateart = Dateart.find(params[:id])

    respond_to do |format|
      if @dateart.update_attributes(params[:dateart])
        flash[:notice] = 'Dateart was successfully updated.'
        format.html { redirect_to(@dateart) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dateart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datearts/1
  # DELETE /datearts/1.xml
  def destroy
    @dateart = Dateart.find(params[:id])
    @dateart.destroy

    respond_to do |format|
      format.html { redirect_to(datearts_url) }
      format.xml  { head :ok }
    end
  end
    def search
    @datearts = Dateart.search params[:name]
    respond_to do |format|
      format.html { render :template =>"datearts/index"}
      format.xml  { render :xml => @datearts }
    end
  end
end