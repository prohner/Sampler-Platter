class TagUsersController < ApplicationController
  ## http://github.com/mbleigh/acts-as-taggable-on

  before_filter :tag_cloud
  
  # GET /tag_users
  # GET /tag_users.xml
  def index
    @tag_users = TagUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tag_users }
    end
  end

  # GET /tag_users/1
  # GET /tag_users/1.xml
  def show
    @tag_user = TagUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag_user }
    end
  end

  # GET /tag_users/new
  # GET /tag_users/new.xml
  def new
    @tag_user = TagUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag_user }
    end
  end

  # GET /tag_users/1/edit
  def edit
    @tag_user = TagUser.find(params[:id])
  end

  # POST /tag_users
  # POST /tag_users.xml
  def create
    @tag_user = move_user_attributes(TagUser.new, params)

    respond_to do |format|
      if @tag_user.save
        flash[:notice] = 'TagUser was successfully created.'
        format.html { redirect_to(@tag_user) }
        format.xml  { render :xml => @tag_user, :status => :created, :location => @tag_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tag_users/1
  # PUT /tag_users/1.xml
  def update
    @tag_user = TagUser.find(params[:id])

    respond_to do |format|
      logger.error("Assigning %s, %s, %s, %s" % [params[:id], params[:name], params[:interests], params[:skills]])
      @tag_user = move_user_attributes(@tag_user, params)
      
      if @tag_user.save
        flash[:notice] = 'TagUser was successfully updated.'
        format.html { redirect_to(@tag_user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_users/1
  # DELETE /tag_users/1.xml
  def destroy
    @tag_user = TagUser.find(params[:id])
    @tag_user.destroy

    respond_to do |format|
      format.html { redirect_to(tag_users_url) }
      format.xml  { head :ok }
    end
  end
  
  def tag_cloud  ##(tag_cloud, category_list)
    @tags = TagUser.tag_counts_on(:skills)
  end

  def tag_users
    @tag_users = TagUser.tagged_with(params[:id])##.by_date
  end
  
private
  def move_user_attributes(the_user, params)
    the_user.name = params[:tag_user][:name]
    the_user.interest_list = params[:tag_user][:interests]
    the_user.skill_list = params[:tag_user][:skills]
    logger.error("Assigning %s, %s, %s" % [params[:tag_user][:name], params[:tag_user][:interests], params[:tag_user][:skills]])
    the_user
  end
end
