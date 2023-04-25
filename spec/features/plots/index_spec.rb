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
        expect(page).to have_content(@plot1.plants)
      end
    end
  end
end