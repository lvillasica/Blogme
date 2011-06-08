class CommentsController < ApplicationController
  
  before_filter :get_article 
  before_filter :authenticate_author!, :except => [:index, :show, :new, :create]

  def index
    @comments = @article.comments.paginate :page => params[:page], :per_page => 5, :order => "updated_at DESC"
    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.xml  { render :xml => @comments }
    end
  end

  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.xml  { render :xml => @comments }
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.article_id = (params[:article_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(article_comment_path(@comment.article_id, @comment), :notice => 'comment was successfully created.') }
        format.js
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(article_comment_path(@article, @comment), :notice => 'comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(article_path(@article)) }
      format.xml  { head :ok }
    end
  end

private
  def get_article
    @article = Article.find(params[:article_id])
  end

end
