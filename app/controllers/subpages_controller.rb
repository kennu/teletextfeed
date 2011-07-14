class SubpagesController < ApplicationController
  # GET /subpages
  # GET /subpages.xml
  def index
    @subpages = Subpage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subpages }
    end
  end

  # GET /subpages/1
  # GET /subpages/1.xml
  def show
    @subpage = Subpage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subpage }
    end
  end

  # GET /subpages/new
  # GET /subpages/new.xml
  def new
    @subpage = Subpage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subpage }
    end
  end

  # GET /subpages/1/edit
  def edit
    @subpage = Subpage.find(params[:id])
  end

  # POST /subpages
  # POST /subpages.xml
  def create
    @subpage = Subpage.new(params[:subpage])

    respond_to do |format|
      if @subpage.save
        format.html { redirect_to(@subpage, :notice => 'Subpage was successfully created.') }
        format.xml  { render :xml => @subpage, :status => :created, :location => @subpage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subpage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subpages/1
  # PUT /subpages/1.xml
  def update
    @subpage = Subpage.find(params[:id])

    respond_to do |format|
      if @subpage.update_attributes(params[:subpage])
        format.html { redirect_to(@subpage, :notice => 'Subpage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subpage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subpages/1
  # DELETE /subpages/1.xml
  def destroy
    @subpage = Subpage.find(params[:id])
    @subpage.destroy

    respond_to do |format|
      format.html { redirect_to(subpages_url) }
      format.xml  { head :ok }
    end
  end
end
