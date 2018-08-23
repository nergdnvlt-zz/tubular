class ForecastsController < ApplicationController
  def show
    @forecast = ConditionService.forecast
  end
end
