class MapsController < ApplicationController
  def index
    @facilities = Facility.all
    @map = Map.new
    @select = params[:facility_id]
    @building = Building.search(params[:building_name]) 
    # params[:building_name]
    
  end
  
  def new
    
  end
  
  def create
    map = Map.new(map_params)
    map[:facility_id] = facility(params[:id])
    map.save
  end
  
  def show
  end
  
  private
  def map_params
    params.require(:map).permit(:facility_id)
  end
end
