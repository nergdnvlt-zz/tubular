class ForecastsController < ApplicationController
  def show
    slug = params[:name]
    binding.pry
    @forecast = Forecast.find_by(name: slug)
  end
end
