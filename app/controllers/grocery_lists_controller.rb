class GroceryListsController < ApplicationController
  # GET /grocery_lists
  # GET /grocery_lists.xml
  def index
    @grocery_lists = GroceryList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @grocery_lists }
      format.atom { render :layout => false }
      format.json { render :json => @grocery_lists }
    end
  end

  # GET /grocery_lists/1
  # GET /grocery_lists/1.xml
  def show
    @grocery_list = GroceryList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grocery_list }
    end
  end

  # GET /grocery_lists/new
  # GET /grocery_lists/new.xml
  def new
    @grocery_list = GroceryList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grocery_list }
    end
  end

  # GET /grocery_lists/1/edit
  def edit
    @grocery_list = GroceryList.find(params[:id])
  end

  def sort
    @grocery_list = GroceryList.find(params[:id])
    @grocery_list.food_items.each do | f |
      f.position = params["my_list"].index(f.id.to_s)+1
      f.save
    end
    #params[:faqs].each_with_index do |id, index|  
    #   Faq.update_all([’position=?’, index+1], [’id=?’, id])  
    # end  
    render :nothing => true

  end

  # POST /grocery_lists
  # POST /grocery_lists.xml
  def create
    @grocery_list = GroceryList.new(params[:grocery_list])

    respond_to do |format|
      if @grocery_list.save
        
        (1..10).each do |i|
          food_item = FoodItem.new(:name => "Item %i" % i, :grocery_list_id => @grocery_list.id, :position => i )
          @grocery_list.food_items << food_item
          food_item.save
        end
        
        flash[:notice] = 'GroceryList was successfully created.'
        format.html { redirect_to(@grocery_list) }
        format.xml  { render :xml => @grocery_list, :status => :created, :location => @grocery_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grocery_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /grocery_lists/1
  # PUT /grocery_lists/1.xml
  def update
    @grocery_list = GroceryList.find(params[:id])

    respond_to do |format|
      if @grocery_list.update_attributes(params[:grocery_list])
        flash[:notice] = 'GroceryList was successfully updated.'
        format.html { redirect_to(@grocery_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grocery_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /grocery_lists/1
  # DELETE /grocery_lists/1.xml
  def destroy
    @grocery_list = GroceryList.find(params[:id])
    @grocery_list.destroy

    respond_to do |format|
      format.html { redirect_to(grocery_lists_url) }
      format.xml  { head :ok }
    end
  end
end
