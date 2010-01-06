class InPlaceEditorController < ApplicationController
  ## http://www.practicalecommerce.com/blogs/post/474-Rails-In-Place-Editing-With-Validation-and-Security
  
  in_place_edit_for :in_place_editor, :name
  #in_place_edit_for :email
  #in_place_edit_for :phone
  protect_from_forgery :except => [:set_in_place_editor_name]
  
  def new
    @in_place_editor = InPlaceEditor.new
  end

  def create
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

end
