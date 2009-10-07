class BreadcrumbController < ApplicationController
  layout 'application'
  before_filter :login_required

  def create
    @breadcrumb = Breadcrumb.new(params[:breadcrumb])
    @breadcrumb.user = current_user

    respond_to do |format|
      if @breadcrumb.save
        flash[:notice] = 'Breadcrumb was successfully created.'
        format.xml  { render :xml => @breadcrumb, :status => :created, :location => @breadcrumb }
      else
        format.xml  { render :xml => @breadcrumb.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
    @breadcrumbs = Breadcrumb.find(:all)
  end

end
