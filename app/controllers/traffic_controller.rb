## From Yahoo:
  ## Congratulations, prestonmscnetcom, your application is now registered! Yeah!
  ## Your application id is GhBNYNjIkY1XHuZ4d9AqAEwRNdKZLDf0IyOolQkZKrY-
  ## Your shared secret is dd0c72158090b841c08a521b0095731a
  ## For application entrypoint -> http://www.mscnet.com
  ## https://developer.apps.yahoo.com/projects?


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

  def find
    logger.error("In the find method")
    logger.error("Address is (%s)" % params[:address])
    begin
      #results = Traffic::get(:location => params[:address],
      #                       :include_map => true)
      results = Traffic.get(:street => "6200 Canoga Ave",
                            :city => "Woodland Hills",
                            :state => "CA",
                            :zip => "91367",
                            :include_map => true)
      unless results.empty?
        @map = Variable.new("map")
        icon_incident = Variable.new("icon_incident")
        icon_construction = Variable.new("icon_construction")
        @traffic_markers = []
        results.each do |result|
          icon = result.type == "construction" ? icon_construction : icon_incident
          marker = GMarker.new(result.latlon, :icon => icon, :info_window => info_window_from_result(result), :title => result.title)
          @traffic_markers << marker
        end
        @center = GLatLng.new(bounding_box_center(@traffic_markers))
      else
        @message = "No traffic information found for #{@params[:address]}"
      end
    rescue Exception => exception
      @message = "Service temporarily unavailable. (%s)" % exception.message
    end
  end
  
private
  def bounding_box_center(markers)
    maxlat, maxlng, minlat, minlng = -Float::MAX, -Float::MAX, Float::MAX, Float::MAX
    markers.each do |marker|
      coord = marker.point
      maxlat = coord.lat if coord.lat > maxlat
      minlat = coord.lat if coord.lat < minlat
      maxlng = coord.lng if coord.lng > maxlng
      minlng = coord.lng if coord.lng < minlng
    end
    return [(maxlat + minlat)/2,(maxlng + minlng)/2]
  end
  
  def info_window_from_result(result)
      return "<div style=\"font-size: 14px;width:200px;background-color:#D2F9F8; \"><strong>#{result.title}</strong></div>
    <div style=\"font-size: 10px;width:200px;background-color:#E9FFFE;\"><div><strong>Severity:</strong> #{result.severity}</div>
    <div><strong>Description:</strong>#{result.description}</div><div><strong>End:</strong>#{result.end_date}</div></div>"
  end
end
