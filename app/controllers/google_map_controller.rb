class GoogleMapController < ApplicationController
  ## http://www.developer.com/open/article.php/10930_3757576_1/Adding-Google-Maps-To-Your-Rails-Applications.htm
  
  def index

    @map = GMap.new("map")
    icon = GIcon.new(:image => "/images/spinner.gif",
                     :icon_anchor => GPoint.new(7, 7),
                     :info_window_anchor => GPoint.new(9, 2))
    @map.icon_global_init(icon, "home_icon")
    home_icon = Variable.new("home_icon")
    
    origin = [34.145227, -118.756588]
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(origin, 10)

    home_address = "123 Lindero Canyon<br />Oak Park, CA 91377<br /><a href=""http://www.google.com"">Google</a>"
    
    oak_park = GMarker.new(origin, 
                          :icon => home_icon,
                          :title => "The Address", 
                          :info_window => "#{home_address}")
    @map.overlay_init(oak_park)

    woodland_hills = GMarker.new([34.165227, -118.60])
    @map.overlay_init(woodland_hills)
  end

end
