class SamplesController < ApplicationController
  ## test note 
  
  def index
  end
  
  def calendar
    y = params.include?(:year) ? params[:year].to_i : Date.today.year
    m = params.include?(:month) ? params[:month].to_i : Date.today.month
    @display_date = Date.new(y, m, 1)
  end
end
