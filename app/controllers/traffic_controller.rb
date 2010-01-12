require "ym4r/yahoo_maps/building_block/traffic"
include Ym4r::YahooMaps::BuildingBlock

class TrafficController < ApplicationController
  def index
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([38.134557,-95.537109],4)
    @map.icon_global_init(GIcon.new(:image => "/images/icon_incident.png", :icon_size => GSize.new(15,15),:icon_anchor => GPoint.new(7,7),:info_window_anchor => GPoint.new(9,2)),"icon_incident")
    @map.icon_global_init(GIcon.new(:image => "/images/icon_construction.png", :icon_size => GSize.new(15,15),:icon_anchor => GPoint.new(7,7),:info_window_anchor => GPoint.new(9,2)),"icon_construction")
    
  end

end
