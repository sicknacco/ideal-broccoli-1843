class PlotPlantsController < ApplicationController
  def destroy
    # require 'pry'; binding.pry
    plot_plant = PlotPlant.find_by(plot_id: params[:id], plant_id: params[:id])
    plot_plant.delete
    redirect_to '/plots'
    ## tried to change the plant_id: params[:everything I could think of]
    ## plant: params[:id]
    ## plant_id: params[plant]
    ## plant_id: params[@plant.id]
    ## plant_id: params[plant.id]
    ## plant_id: params[plant_id]
  end
end