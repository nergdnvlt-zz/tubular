# require 'rails_helper'
#
# describe 'ConditionService' do
#   describe 'pings the API' do
#     it 'to get a weather report' do
#       VCR.use_cassette('requests/makes_API_request') do
#         response = ConditionService.response
#
#         expect(response[:temperature_f]).to eq('69')
#         expect(response[:weather_condition]).to eq('Mostly Cloudy')
#         expect(response[:flow_rate_cfs]).to eq(106)
#       end
#     end
#   end
# end
