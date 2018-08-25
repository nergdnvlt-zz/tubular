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
        result = UpdateConditionService.condition('boulder_creek')
        condition = CurrentCondition.find_by(name: 'boulder_creek')

        expect(condition.current_temp).to_not eq(85)
        expect(condition.current_flow).to_not eq(88)
        expect(condition.current_clouds).to_not equal('Clear')

        expect(condition.current_temp).to eq(82.0)
        expect(condition.current_flow).to eq(55.4)
        expect(condition.current_clouds).to eq('Mostly Cloudy')
      end
    end
  end
end
