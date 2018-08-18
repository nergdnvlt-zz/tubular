class Forecast
  attr_reader :current_temp, :current_clouds, :current_flow

  def initialize
    @conditions ||= conditions
    @current_temp = @conditions[:temperature_f]
    @current_clouds = @conditions[:weather_condition]
    @current_flow = @conditions[:flow_rate_cfs]
  end

  def recommendation
    if temp? && flow? && clouds?
      'Go Tubing!'
    else
      'Sorry, not now. Maybe later.'
    end
  end

  private

  def conditions
    ConditionService.response
  end

  def temp?
    @current_temp.to_i > 85
  end

  def flow?
    @current_flow > 40 && @current_flow < 300
  end

  def clouds?
    acceptable_clouds.include?(@current_clouds)
  end

  def acceptable_clouds
    [ 'Windy',
      'Cloudy',
      'Mostly Cloudy',
      'Partly Cloudy',
      'Clear',
      'Sunny',
      'Fair',
      'Hot' ]
  end
end
