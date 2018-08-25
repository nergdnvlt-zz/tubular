require 'rails_helper'

describe 'User visits the root page' do
  describe 'to see what the weather is' do
    it 'gives them a negative analysis of the current tubing conditions' do
      base = BaseCondition.create!(
        name: 'boulder_creek',
        min_temp: 85,
        min_flow: 40,
        max_flow: 300,
        acceptable_clouds:
        [
          'Windy',
          'Cloudy',
          'Mostly Cloudy',
          'Partly Cloudy',
          'Clear',
          'Sunny',
          'Fair',
          'Hot'
        ]
      )
      CurrentCondition.create!(name: 'boulder_creek', base_condition: base, current_temp: 85, current_flow: 88, current_clouds: 'Clear')

      # User visits the root page
      visit '/'

      click_on 'Boulder Creek'
      expect(current_path).to eq('/boulder_creek')

      # User sees the current weather conditions
      expect(page).to have_css('.current_temp')
      expect(page).to have_content('Current Temperature: 85.0 degrees')
      expect(page).to have_css('.current_conditions')
      expect(page).to have_content('Current Cloud Coverage: Clear')
      expect(page).to have_css('.current_flow')
      expect(page).to have_content('Current Flow Rate: 88.0 CFS')

      # User will also see a recommendation of the tubing conditions
      expect(page).to have_css('.recommendation')
      expect(page).to have_content('Sorry, not now. Maybe later.')
    end

    it 'gives them a postive analysis of the current tubing conditions' do
      base = BaseCondition.create!(
        name: 'boulder_creek',
        min_temp: 85,
        min_flow: 40,
        max_flow: 300,
        acceptable_clouds:
        [
          'Windy',
          'Cloudy',
          'Mostly Cloudy',
          'Partly Cloudy',
          'Clear',
          'Sunny',
          'Fair',
          'Hot'
        ]
      )
      CurrentCondition.create!(name: 'boulder_creek', base_condition: base, current_temp: 90, current_flow: 100, current_clouds: 'Clear')

      # User visits the root page
      visit '/'

      click_on 'Boulder Creek'
      expect(current_path).to eq('/boulder_creek')

      # User sees the current weather conditions
      expect(page).to have_css('.current_temp')
      expect(page).to have_content('Current Temperature: 90.0 degrees')
      expect(page).to have_css('.current_conditions')
      expect(page).to have_content('Current Cloud Coverage: Clear')
      expect(page).to have_css('.current_flow')
      expect(page).to have_content('Current Flow Rate: 100.0 CFS')

      # User will also see a recommendation of the tubing conditions
      expect(page).to have_css('.recommendation')
      expect(page).to have_content('Hit the River!')
    end
  end
end
