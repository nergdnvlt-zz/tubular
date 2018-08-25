require 'rails_helper'

describe 'Update Condition Service' do
  describe 'instantiates a condition service request' do
    it 'to update the weather database' do
      VCR.use_cassette('requests/updates_db_condition') do
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
        condition = UpdateConditionService.condtion

        expect(condition.current_temp).to not_eq(85)
        expect(condition.current_flow).to not_eq(88)
        expect(condition.current_clouds).to not_eq('Clear')

        expect(condition.current_temp).to eq(83)
        expect(condition.current_flow).to eq(55.4)
        expect(condition.current_clouds).to eq('Mostly Cloudy')
      end
    end
  end
end
