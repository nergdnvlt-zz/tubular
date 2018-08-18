class ForecastsController < ApplicationController
  def show
    @forecast = Forecast.new()
  end
end
