class UpdateConditionService
  def self.condition(location_name)
    new(location_name).save_current_condition
  end

  def save_current_condition
    @condition.update(
      current_temp: @request[:temperature_f],
      current_flow: @request[:flow_rate_cfs],
      current_clouds: @request[:weather_condition])
    @condition.save
  end

  private

  def initialize(location_name)
    @condition = CurrentCondition.find_by(name: location_name)
    @request ||= ConditionService.response
  end
end
