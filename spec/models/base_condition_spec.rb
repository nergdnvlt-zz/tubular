require 'rails_helper'

describe BaseCondition do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :min_temp }
    it { should validate_presence_of :min_flow }
    it { should validate_presence_of :max_flow }
    it { should validate_presence_of :acceptable_clouds }

    it { should have_one :current_condition }
  end
end
