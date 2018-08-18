require 'rails_helper'

describe 'Forecast' do
  describe 'Attributes' do
    it 'initializes properly' do
      forecast = Forecast.new()

      expect(forecast.current_temp).to eq('69')
      expect(forecast.current_clouds).to eq('Mostly Cloudy')
      expect(forecast.current_flow).to eq(106)
    end
  end
  describe 'Instance Methods' do
    it 'makes a correct recommendation' do
      forecast = Forecast.new
      expect(forecast.recommendation).to eq('Sorry, not now. Maybe later.')
    end
  end
end
