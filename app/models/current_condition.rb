class CurrentCondition < ApplicationRecord
  validates_presence_of :name, :current_temp, :current_flow, :current_clouds
  belongs_to :base_condition
end
