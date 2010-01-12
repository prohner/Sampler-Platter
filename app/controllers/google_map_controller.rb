class GoogleMapController < ApplicationController
  ## http://www.developer.com/open/article.php/10930_3757576_1/Adding-Google-Maps-To-Your-Rails-Applications.htm
  
  def index
    origin = [34.145227, -118.756588]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(origin, 10)

    home_address = "123 Lindero Canyon<br />Oak Park, CA 91377<br /><a href=""http://www.google.com"">Google</a>"
    
    oak_park = GMarker.new(origin, :title => "The Address", :info_window => "#{home_address}")
    @map.overlay_init(oak_park)

    woodland_hills = GMarker.new([34.165227, -118.60])
    @map.overlay_init(woodland_hills)
  end

end
