require 'rails_helper'

describe 'User visits the root page' do
  describe 'to see what the weather is' do
    it 'gives them an analysis of the current tubing conditions' do
      # User visits the root page
      visit '/'

      # User sees the current weather conditions
      expect(page).to have_css('.current_temp')
      expect(page).to have_content('Current Temperature: 69 degrees')
      expect(page).to have_css('.current_conditions')
      expect(page).to have_content('Current Cloud Coverage: Mostly Cloudy')
      expect(page).to have_css('.current_flow')
      expect(page).to have_content('Current Flow Rate: 106.0 CFS')

      # User will also see a recommendation of the tubing conditions
      expect(page).to have_css('.recommendation')
      expect(page).to have_content('Sorry, not now. Maybe later.')
    end
  end
end
