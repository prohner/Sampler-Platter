class PaginationController < ApplicationController
  ## http://www.smashingmagazine.com/2007/11/16/pagination-gallery-examples-and-good-practices/
  ## TODO:  The query value from the form gets lost when you click the will_paginate navigation links
  
  def index
    @pagination_items = PaginationItem.search(params[:query], params[:page]) 
    respond_to do |format|
      format.html
      format.js {
        render :update do |page|
          page.replace_html 'pagination_items_table', :partial => "pagination_items"
        end
      }
    end
  end
  
end
