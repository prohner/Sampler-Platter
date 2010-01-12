class InPlaceEditorController < ApplicationController
  ## http://www.practicalecommerce.com/blogs/post/474-Rails-In-Place-Editing-With-Validation-and-Security
  
  in_place_edit_for :in_place_editor, :name
  #in_place_edit_for :email
  #in_place_edit_for :phone
  protect_from_forgery :except => [:set_in_place_editor_name]
  
  def new
    @in_place_editor = InPlaceEditor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @in_place_editor }
    end
  end

  def create
    @in_place_editor = InPlaceEditor.new(params[:in_place_editor])

    respond_to do |format|
      if @in_place_editor.save
        flash[:notice] = 'InPlaceEditor was successfully created.'
        format.html { redirect_to(:action => "index") }
        format.xml  { render :xml => @in_place_editor, :status => :created, :location => @in_place_editor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @in_place_editor.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def xxset_in_place_editor_name
    in_place_editor = InPlaceEditor.find(params[:id])
    in_place_editor.name = params[:value]
    in_place_editor.save
    render :text => params[:value]
  end

  def show
    @in_place_editor = InPlaceEditor.find(params[:id])
  end

  def index
    @in_place_editors = InPlaceEditor.all
  end

  def destroy
    @in_place_editor = InPlaceEditor.find(params[:id])
    @in_place_editor.destroy

    respond_to do |format|
      format.html { redirect_to(:action => "index") }
      format.xml  { head :ok }
    end
  end
end
