# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Garden.destroy_all
  Plot.destroy_all
  Plant.destroy_all
  PlotPlant.destroy_all

  @gard1 = Garden.create!(name: "Park Garden", organic: true)
  @gard2 = Garden.create!(name: "Other Garden", organic: false)

  @plot1 = @gard1.plots.create!(number: 1, size: "Little", direction: "East")
  @plot2 = @gard1.plots.create!(number: 2, size: "Big", direction: "West")

  @plot3 = @gard2.plots.create!(number: 3, size: "Gigantic", direction: "East")
  @plot4 = @gard2.plots.create!(number: 4, size: "Tiny", direction: "East")

  @tomato = Plant.create!(name: "Tomato", description: "Grows like a weed", days_to_harvest: 90)
  @radish = Plant.create!(name: "Rasish", description: "Plain Radish", days_to_harvest: 120)
  @beans = Plant.create!(name: "Beans", description: "Looks like a bean", days_to_harvest: 45)
  @peas = Plant.create!(name: "Peas", description: "Green Peas", days_to_harvest: 34)
  @squash = Plant.create!(name: "Squash", description: "Big yellow ones", days_to_harvest: 100)
  @pineapple = Plant.create!(name: "Pineapple", description: "Grows out of the ground!", days_to_harvest: 60)

  PlotPlant.create!(plot: @plot1, plant:@tomato)
  PlotPlant.create!(plot: @plot1, plant:@peas)
  PlotPlant.create!(plot: @plot1, plant:@beans)

  PlotPlant.create!(plot: @plot2, plant:@beans)
  PlotPlant.create!(plot: @plot2, plant:@pineapple)
  PlotPlant.create!(plot: @plot2, plant:@squash)

  PlotPlant.create!(plot: @plot3, plant:@radish)
  PlotPlant.create!(plot: @plot3, plant:@peas)
  PlotPlant.create!(plot: @plot3, plant:@squash)

  PlotPlant.create!(plot: @plot4, plant:@tomato)
  PlotPlant.create!(plot: @plot4, plant:@pineapple)
  PlotPlant.create!(plot: @plot4, plant:@radish)