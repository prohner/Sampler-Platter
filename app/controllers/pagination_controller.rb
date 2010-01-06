class PaginationController < ApplicationController
  ## http://www.smashingmagazine.com/2007/11/16/pagination-gallery-examples-and-good-practices/
  
  def index
    @pagination_items = PaginationItem.paginate :per_page => 5,
                                                :page => params[:page],
                                                :conditions => [ 'name like ?', "%#{params[:search]}" ],
                                                :order => :name
  end
  
  def list
  end
end
