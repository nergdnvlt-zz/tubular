class ConditionsController < ApplicationController
  def show
    @forecast = ConditionPresenter.new(params[:name])
  end
end
