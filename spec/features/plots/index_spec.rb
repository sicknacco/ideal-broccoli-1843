require 'rails_helper'

RSpec.describe "/plots Plots Index Page", type: :feature do
  before(:each) do
    test_data

  end
  describe "When I visit the plots index page ('/plots')" do
    it "I see a list of all plot numbers and all of that plots plants" do
      visit '/plots'

      within "#plot_info_#{@plot1.id}" do
        expect(page).to have_content(@plot1.number)
        expect(page).to have_content(@tomato.name)
        expect(page).to have_content(@peas.name)
        expect(page).to have_content(@beans.name)
        expect(page).to_not have_content(@pineapple.name)
      end
      
      within "#plot_info_#{@plot2.id}" do
        expect(page).to have_content(@plot2.number)
        expect(page).to have_content(@beans.name)
        expect(page).to have_content(@pineapple.name)
        expect(page).to have_content(@squash.name)
        expect(page).to_not have_content(@tomato.name)
      end
    end
  end
end