class GoogleMapController < ApplicationController
  ## http://www.developer.com/open/article.php/10930_3757576_1/Adding-Google-Maps-To-Your-Rails-Applications.htm
  
  def index
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => false)
    @map.center_zoom_init([41, -80], 10)
  end

end
