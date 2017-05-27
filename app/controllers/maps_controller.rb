class MapsController < ApplicationController
  def index
    @facilities = Facility.all
    @map = Map.new
    @select = params[:facility_id]
    @building = Building.search(params[:search])
  end
  
  def new
    
  end
  
  def create
    map = Map.new(map_params)
    map[:facility_id] = facility(params[:id])
    map.save
    # @select = params[:facility_id]

    # redirect_to new_map_path
    # if facility_id == 1
    #   redirect_to maps_path
    # else
    #   redirect_to new_map_path
    # end
  end
  
  def show
  end
  
  private
  def map_params
    params.require(:map).permit(:facility_id)
  end
end
