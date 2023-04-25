class PlotPlantsController < ApplicationController
  def destroy
    plot_plant = PlotPlant.find_by(plot_id: params[:id], plant_id:[:id])
    plot_plant.destroy
    redirect_to '/plots'
  end
end