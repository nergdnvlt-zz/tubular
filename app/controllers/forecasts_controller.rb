class ForecastsController < ApplicationController
  def show
    @forecast = Forecast.new()
    binding.pry
  end
end

class Forecast
  attr_reader :current_temp, :current_clouds, :current_flow

  def initialize
    @conditions ||= conditions
    @current_temp = @conditions[:temperature_f]
    @current_clouds = @conditions[:weather_condition]
    @current_flow = @conditions[:flow_rate_cfs]
  end

  private

  def conditions
    ConditionService.response
  end
end

class ConditionService

  def self.response
    new().response
  end

  def response
    JSON.parse(request.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://boulder-tubing-api.herokuapp.com/conditions')
  end

  def request
    conn.get { |req| }
  end
end
