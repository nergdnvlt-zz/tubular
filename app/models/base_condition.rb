class BaseCondition < ApplicationRecord
  validates_presence_of :name, :min_temp, :min_flow, :max_flow, :acceptable_clouds
  has_one :current_condition
end
