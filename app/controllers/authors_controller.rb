class AuthorsController < ApplicationController

  def index
    @authors = Author.paginate :page => params[:page], :order => 'updated_at ASC'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authors }
    end
  end

  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @authors }
    end
  end

  def new
    @author = Author.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @authors }
    end
  end
  
  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(params[:author])
    #@author.photo = params[:photo]
    respond_to do |format|
      if @author.save
        format.html { redirect_to(@author, :notice => 'Author was successfully created.') }
        format.xml  { render :xml => @author, :status => :created, :location => @author }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @author = Author.find(params[:id])
    #@author.photo= params[:photo]
    respond_to do |format|
      if @author.update_attributes(params[:author])
        format.html { redirect_to(@author, :notice => 'author was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @author.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to(authors_url) }
      format.xml  { head :ok }
    end
  end

end
