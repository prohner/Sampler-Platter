class GoogleMapController < ApplicationController
  def index
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => false)
    @map.center_zoom_init([41, -80], 10)
  end

end
