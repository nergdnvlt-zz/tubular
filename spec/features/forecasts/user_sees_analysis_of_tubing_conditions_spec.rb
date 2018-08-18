require 'rails_helper'

describe 'User visits the root page' do
  describe 'to see what the weather is' do
    it 'gives them an analysis of the current tubing conditions' do
      # User visits the root page
      visit '/'

      # User sees the current weather conditions
      expect(page).to have_css('.current_temp')
      expect(page).to have_css('.current_conditions')
      expect(page).to have_css('.current_flow')

      # User will also see a recommendation of the tubing conditions
      expect(page).to have_css('.recommendation')
    end
  end
end
