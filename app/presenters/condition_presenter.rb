class ConditionPresenter < DelegatePresenter::Base
  attr_reader :current_temp, :current_flow, :current_clouds

  def initialize(name)
    @base ||= BaseCondition.find_by(name: name)
    @current_temp = @base.current_condition.current_temp
    @current_flow = @base.current_condition.current_flow
    @current_clouds = @base.current_condition.current_clouds
  end

  def recommendation
    if recommended?
      "Hit the River!"
    else
      'Sorry, not now. Maybe later.'
    end
  end

  private

  def recommended?
    temp? && flow? && good_clouds?
  end

  def temp?
    @current_temp > @base.min_temp
  end

  def flow?
    @current_flow > @base.min_flow && @current_flow < @base.max_flow
  end

  def good_clouds?
    @base.acceptable_clouds.include?(@current_clouds)
  end
end
