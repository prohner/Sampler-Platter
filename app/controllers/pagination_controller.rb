class PaginationController < ApplicationController
  ## http://www.smashingmagazine.com/2007/11/16/pagination-gallery-examples-and-good-practices/
  
  def index
    paginate_data
  end
  
  def list
    paginate_data
  end
  
private

  def paginate_data
    @pagination_items = PaginationItem.paginate :per_page => 5,
                                                :page => params[:page],
                                                :conditions => [ 'name like ?', "%#{params[:query]}%" ],
                                                :order => :name
  end
end
