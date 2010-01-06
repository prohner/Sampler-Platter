class PaginationController < ApplicationController
  ## http://www.smashingmagazine.com/2007/11/16/pagination-gallery-examples-and-good-practices/
  
  def index
    @pagination_items = PaginationItem.paginate :per_page => 5,
                                                :page => params[:page],
                                                :conditions => [ 'name like ?', "%#{params[:query]}%" ],
                                                :order => :name
    respond_to do |format|
      format.html
      format.js {
        render :update do |page|
          page.replace_html 'pagination_items_table', :partial => "pagination_items"
        end
      }
    end
  end
  
  def list 
    logger.error("LANDED IN LIST ACCIDENTALLY")
    paginate_data
  end
  
private

  def paginate_data
  end
end
